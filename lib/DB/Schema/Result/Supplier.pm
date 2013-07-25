use utf8;
package DB::Schema::Result::Supplier;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Supplier

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Supplier>

=cut

__PACKAGE__->table("Supplier");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 supplydetailid

  data_type: 'integer'
  is_nullable: 1

=head2 rolecode

  data_type: 'integer'
  is_nullable: 1

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "supplydetailid",
  { data_type => "integer", is_nullable => 1 },
  "rolecode",
  { data_type => "integer", is_nullable => 1 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 100 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-07-25 00:42:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DG2pc9qJ9UPappkzg2sxqg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
