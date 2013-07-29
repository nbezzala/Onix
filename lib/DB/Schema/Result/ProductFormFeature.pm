use utf8;
package DB::Schema::Result::ProductFormFeature;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::ProductFormFeature

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ProductFormFeature>

=cut

__PACKAGE__->table("ProductFormFeature");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 descriptivedetailid

  data_type: 'integer'
  is_nullable: 1

=head2 featuretype

  data_type: 'integer'
  is_nullable: 1

=head2 featurevalue

  data_type: 'char'
  is_nullable: 1
  size: 2

=head2 featuredesc

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "descriptivedetailid",
  { data_type => "integer", is_nullable => 1 },
  "featuretype",
  { data_type => "integer", is_nullable => 1 },
  "featurevalue",
  { data_type => "char", is_nullable => 1, size => 2 },
  "featuredesc",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-07-29 07:50:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xFduXubsKpETYgRGWeeV5Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->belongs_to( desc_detail => 'DB::Schema::Result::DescriptiveDetail', 'descriptivedetailid' );

1;
