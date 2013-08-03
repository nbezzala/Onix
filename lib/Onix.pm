package Onix;

=head2
The lib file which is called from the .pl which is run by the user.
Used to read the file name from the command line
And to creat the products

One XMLMessage can have many Products.
=cut

use Moose;
use Data::Dumper;
with 'Onix::DB';
with 'MooseX::Getopt::Strict';

has 'xml_file' => (
				is => 'rw', isa => 'Str', traits => ['Getopt'],
				required => 1,
				documentation => 'Please enter the full path of a valid xml file',
			  );

sub create_products {
	my $self = shift;
	my $books = shift;

	foreach my $product( @{$books->products} ) {
		$self->create_product($product);
	}
}

=head2
Todo: add  transactions if needed.
=cut
sub create_product {
	my $self 	= shift;
	my $product	= shift;

	my $formdetails = $self->get_form_details($product);
	my $features = $self->get_formfeatures($product);
	my $supplies = $self->get_supplies($product);

	my $new_record = $self->schema->resultset('Product')->create({
		reference	=> $product->record_ref,
		identifier	=> {
			idtypecode	=> $product->prod_ident->pid_type,
			idvalue		=> $product->prod_ident->id_value,
		},
		desc_detail	=> {
				compositioncode	=> $product->desc_detail->prod_composition,
				formcode		=> $product->desc_detail->prod_formcode,
				formdetails		=> $formdetails,
				features		=> $features,
		},
		supplies => $supplies,
	});
}

sub get_form_details {
	my $self = shift;
	my $product = shift;

	my @array;
	foreach my $fd ( @{$product->desc_detail->form_details} ) {
		push @array, { 'formdetail' => $fd };
	}
	
	return \@array;
}

sub get_formfeatures {
	my $self	= shift;
	my $product	= shift;

	my @array;
	foreach my $feature ( @{ $product->desc_detail->features } ) {
		push @array, 
			{ 
				featuretype => $feature->feature_type,
				 featurevalue	=> $feature->feature_value,
				 featuredesc	=> $feature->feature_desc,
			};
	}

	return \@array;
}

sub get_supplies {
	my $self	= shift;
	my $product	= shift;

	my @array;
	foreach my $supply ( @{ $product->supplies }) {
		push @array,
		{
			supply_details => $self->get_supply_details($supply)
		};	
	}

#print Dumper(\@array);
	return \@array;
}

sub get_supply_details {
	my $self	= shift;
	my $supply	= shift;

	my @array;
	foreach my $supply_detail ( @{ $supply->supply_details }) {
		push @array,
			{	
				productavailability	=> $supply_detail->availability,
				supplier			=> $self->get_suppliers($supply_detail),
				supply_dates		=> $self->get_supply_dates($supply_detail),
				stocks				=> $self->get_stocks($supply_detail),
				prices				=> $self->get_prices($supply_detail),	
			 };
	}
		
	return \@array;
}

sub get_suppliers {
	my $self			= shift;
	my $supply_detail	= shift;

	return	{
				rolecode	=> $supply_detail->supplier->supplier_role,
				name		=> $supply_detail->supplier->supplier_name,
			};

}

sub get_supply_dates {
	my $self			= shift;
	my $supply_detail	= shift;

	my @array;
	foreach my $date ( @{ $supply_detail->supply_dates }) {
		push @array,
			{	
				supplydaterole	=> $date->role,
				date			=> $date->date,
			 };
	}
		
	return \@array;
}

sub get_prices {
	my $self			= shift;
	my $supply_detail	= shift;

	my @array;
	foreach my $price ( @{ $supply_detail->prices }) {
		push @array,
			{	
				pricetype		=> $price->type,
				priceamount		=> $price->amount,
				currencycode	=> $price->currency_code,
			 };
	}
		
	return \@array;
}


sub get_stocks {
	my $self			= shift;
	my $supply_detail	= shift;

	my @array;
	foreach my $stock ( @{ $supply_detail->stocks }) {
		push @array,
			{	
				onorder		=> $stock->on_order,
				on_hand		=> $self->get_on_hand($stock->on_hand),
			 };
	}
		
	return \@array;
}

sub get_on_hand {
	my $self	= shift;
	my $on_hand	= shift;

	my @array;
	foreach my $on_hand ( @$on_hand ) {
		push @array, { onhand => $on_hand };
	}
	return \@array;
}

1;
