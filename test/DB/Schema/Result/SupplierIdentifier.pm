use utf8;
package DB::Schema::Result::SupplierIdentifier;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::SupplierIdentifier

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<SupplierIdentifier>

=cut

__PACKAGE__->table("SupplierIdentifier");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 supplierid

  data_type: 'integer'
  is_nullable: 1

=head2 typecode

  data_type: 'integer'
  is_nullable: 1

=head2 typename

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 idvalue

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "supplierid",
  { data_type => "integer", is_nullable => 1 },
  "typecode",
  { data_type => "integer", is_nullable => 1 },
  "typename",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "idvalue",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-07-25 09:04:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yxamMTi47Nqo8ndHd1l8Wg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
