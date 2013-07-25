package Onix;

=head2
The lib file which is called from the .pl which is run by the user.
Used to read the file name from the command line
And to creat the product
=cut

use Moose;
with 'Onix::DB';
with 'MooseX::Getopt::Strict';

has 'file' => (
				is => 'rw', isa => 'Str', traits => ['Getopt'],
				documentation => 'Please enter filename',
			  );

=head2
Todo: add  transactions if needed.
=cut
sub create_product {
	my $self 	= shift;
	my $product	= shift;

	my $new_record = $self->schema->resultset('Product')->create({
		reference	=> $product->record_ref,
		identifier	=> {
			idtypecode	=> $product->prod_ident->pid_type,
		}	
	});
}
#print $product->prod_ident->pid_type, "\n";
#print $product->prod_ident->id_value, "\n";

1;
