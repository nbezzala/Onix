use utf8;
package DB::Schema::Result::ProductIdentifier;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::ProductIdentifier

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ProductIdentifier>

=cut

__PACKAGE__->table("ProductIdentifier");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 productid

  data_type: 'integer'
  is_nullable: 1

=head2 idtypecode

  data_type: 'integer'
  is_nullable: 0

=head2 idtypename

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
  "productid",
  { data_type => "integer", is_nullable => 1 },
  "idtypecode",
  { data_type => "integer", is_nullable => 0 },
  "idtypename",
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nIJtUpMEeoe2/2jvYXTAcw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

#__PACKAGE__->belongs_to( product => 'DB::Schema::Result::Product', 'identifierid' );

1;
