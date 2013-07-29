use utf8;
package DB::Schema::Result::DescriptiveDetail;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::DescriptiveDetail

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<DescriptiveDetail>

=cut

__PACKAGE__->table("DescriptiveDetail");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 compositioncode

  data_type: 'integer'
  is_nullable: 0

=head2 formcode

  data_type: 'char'
  is_nullable: 0
  size: 2

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "compositioncode",
  { data_type => "integer", is_nullable => 0 },
  "formcode",
  { data_type => "char", is_nullable => 0, size => 2 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-07-29 01:44:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qXwEC1htzMAag80IiXRQvg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->has_one( product => 'DB::Schema::Result::Product', 'descdetailid' );

1;
