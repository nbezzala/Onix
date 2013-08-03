use utf8;
package DB::Schema::Result::Price;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Price

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Price>

=cut

__PACKAGE__->table("Price");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 supplydetailid

  data_type: 'integer'
  is_nullable: 0

=head2 pricetype

  data_type: 'integer'
  is_nullable: 1

=head2 priceamount

  data_type: 'decimal'
  is_nullable: 1
  size: [16,4]

=head2 currencycode

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "supplydetailid",
  { data_type => "integer", is_nullable => 0 },
  "pricetype",
  { data_type => "integer", is_nullable => 1 },
  "priceamount",
  { data_type => "decimal", is_nullable => 1, size => [16, 4] },
  "currencycode",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-08-03 07:36:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2gKjpjBV1Rbs0kgz4RQvCA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->belongs_to( supply_detail => 'DB::Schema::Result::SupplyDetail', 'supplydetailid' );

1;
