package Onix;

use Moose;
with 'Onix::DB';
with 'MooseX::Getopt::Strict';

has 'file' => (
				is => 'rw', isa => 'Str', traits => ['Getopt'],
				documentation => 'Please enter filename',
			  );

=head2
Todo: add  transactions.
=cut
sub create_product {
	my $self 	= shift;
	my $product	= shift;

	my $new_record = $self->schema->resultset('Product')->create({
		reference	=> $product->record_ref,
	});
}

1;
