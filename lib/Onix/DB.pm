package Onix::DB;

use Moose::Role;
use DB::Schema;

has 'schema' => ( is => 'rw', isa => 'DB::Schema', );

=head2
We get a DB connection in the constructor
=cut

sub BUILD {
        my $self = shift;

        my $dbi_dsn = "dbi:mysql:onix;host=localhost";
        my $schema = DB::Schema->connect($dbi_dsn, 'root' );
        $self->schema($schema);

}

1;
