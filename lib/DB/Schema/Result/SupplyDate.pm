use utf8;
package DB::Schema::Result::SupplyDate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::SupplyDate

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<SupplyDate>

=cut

__PACKAGE__->table("SupplyDate");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 supplydetailid

  data_type: 'integer'
  is_nullable: 0

=head2 supplydaterole

  data_type: 'integer'
  is_nullable: 1

=head2 date

  data_type: 'varchar'
  is_nullable: 1
  size: 12

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "supplydetailid",
  { data_type => "integer", is_nullable => 0 },
  "supplydaterole",
  { data_type => "integer", is_nullable => 1 },
  "date",
  { data_type => "varchar", is_nullable => 1, size => 12 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-08-03 07:36:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Qh3LptEl7ruXaZRlXoJQ9A


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->belongs_to( supply_dates => 'DB::Schema::Result::SupplyDetail', 'supplydetailid' );

1;
