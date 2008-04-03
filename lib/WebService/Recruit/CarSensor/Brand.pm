package WebService::Recruit::CarSensor::Brand;

use strict;
use base qw( WebService::Recruit::CarSensor::Base );
use vars qw( $VERSION );
use Class::Accessor::Fast;
use Class::Accessor::Children::Fast;

$VERSION = '0.0.2';

sub http_method { 'GET'; }

sub url { 'http://webservice.recruit.co.jp/carsensor/brand/v1/'; }

sub query_class { 'WebService::Recruit::CarSensor::Brand::Query'; }

sub query_fields { [
    'key', 'country'
]; }

sub default_param { {
    'format' => 'xml'
}; }

sub notnull_param { [
    'key'
]; }

sub elem_class { 'WebService::Recruit::CarSensor::Brand::Element'; }

sub root_elem { 'results'; }

sub elem_fields { {
    'brand' => ['code', 'name', 'country'],
    'country' => ['code', 'name'],
    'error' => ['message'],
    'results' => ['api_version', 'results_available', 'results_returned', 'results_start', 'brand', 'api_version', 'error'],

}; }

sub force_array { [
    'brand'
]; }

# __PACKAGE__->mk_query_accessors();

@WebService::Recruit::CarSensor::Brand::Query::ISA = qw( Class::Accessor::Fast );
WebService::Recruit::CarSensor::Brand::Query->mk_accessors( @{query_fields()} );

# __PACKAGE__->mk_elem_accessors();

@WebService::Recruit::CarSensor::Brand::Element::ISA = qw( Class::Accessor::Children::Fast );
WebService::Recruit::CarSensor::Brand::Element->mk_ro_accessors( root_elem() );
WebService::Recruit::CarSensor::Brand::Element->mk_child_ro_accessors( %{elem_fields()} );

=head1 NAME

WebService::Recruit::CarSensor::Brand - CarSensor.net Web Service "brand" API

=head1 SYNOPSIS

    use WebService::Recruit::CarSensor;
    
    my $service = WebService::Recruit::CarSensor->new();
    
    my $param = {
        'key' => $ENV{'WEBSERVICE_RECRUIT_KEY'},
    };
    my $res = $service->brand( %$param );
    my $data = $res->root;
    print "api_version: $data->api_version\n";
    print "results_available: $data->results_available\n";
    print "results_returned: $data->results_returned\n";
    print "results_start: $data->results_start\n";
    print "brand: $data->brand\n";
    print "...\n";

=head1 DESCRIPTION

This module is a interface for the C<brand> API.
It accepts following query parameters to make an request.

    my $param = {
        'key' => 'XXXXXXXX',
        'country' => 'LE',
    };
    my $res = $service->brand( %$param );

C<$service> above is an instance of L<WebService::Recruit::CarSensor>.

=head1 METHODS

=head2 root

This returns the root element of the response.

    my $root = $res->root;

You can retrieve each element by the following accessors.

    $root->api_version
    $root->results_available
    $root->results_returned
    $root->results_start
    $root->brand
    $root->brand->[0]->code
    $root->brand->[0]->name
    $root->brand->[0]->country
    $root->brand->[0]->country->code
    $root->brand->[0]->country->name


=head2 xml

This returns the raw response context itself.

    print $res->xml, "\n";

=head2 code

This returns the response status code.

    my $code = $res->code; # usually "200" when succeeded

=head2 is_error

This returns true value when the response has an error.

    die 'error!' if $res->is_error;

=head1 SEE ALSO

L<WebService::Recruit::CarSensor>

=head1 AUTHOR

RECRUIT Media Technology Labs <mtl@cpan.org>

=head1 COPYRIGHT

Copyright 2008 RECRUIT Media Technology Labs

=cut
1;
