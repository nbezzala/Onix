use utf8;
package DB::Schema::Result::ProductSupply;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::ProductSupply

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ProductSupply>

=cut

__PACKAGE__->table("ProductSupply");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 productid

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "productid",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-07-25 09:04:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uWsXA7AfqQmwWZ6XMpf4JA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
