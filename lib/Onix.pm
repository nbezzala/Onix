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

1;
