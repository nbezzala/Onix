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

print Dumper($product->desc_detail->form_details);
	my $aref;
	foreach my $fd ( @{$product->desc_detail->form_details} ) {
		push @{$aref}, { 'formdetail' => $fd };
	}

	my $new_record = $self->schema->resultset('Product')->create({
		reference	=> $product->record_ref,
		identifier	=> {
			idtypecode	=> $product->prod_ident->pid_type,
			idvalue		=> $product->prod_ident->id_value,
		},
		desc_detail	=> {
				compositioncode	=> $product->desc_detail->prod_composition,
				formcode		=> $product->desc_detail->prod_formcode,
				formdetails	=> $aref,
		},
	});
}

1;
