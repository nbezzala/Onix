use utf8;
package DB::Schema::Result::Product;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Product

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Product>

=cut

__PACKAGE__->table("Product");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 reference

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 identifierid

  data_type: 'integer'
  is_nullable: 1

=head2 descdetailid

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "reference",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "identifierid",
  { data_type => "integer", is_nullable => 1 },
  "descdetailid",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<Reference>

=over 4

=item * L</reference>

=back

=cut

__PACKAGE__->add_unique_constraint("Reference", ["reference"]);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-07-29 00:49:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:K8V5gYgloCXDk8GOA/B9CA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->belongs_to( identifier => 'DB::Schema::Result::ProductIdentifier', 'identifierid' );
__PACKAGE__->belongs_to( desc_detail => 'DB::Schema::Result::DescriptiveDetail', 'descdetailid' );
__PACKAGE__->has_many( supplies => 'DB::Schema::Result::ProductSupply', 'productid' );

1;
