use Module::Build;

my $build = Module::Build->new
(
	module_name => 'IO::Socket::Multicast6',
	license => 'perl',
	build_requires => {
		'Module::Build' => '0.20'
	},
	requires => {
		'perl'				=> '5.6.1',
		'Test::More'		=> 0,
		'IO::Interface'		=> '0.94',
		'Socket::Multicast6'=> '0.01',
		'IO::Socket::INET6'	=> '2.51',
	},
	
	create_makefile_pl => 'passthrough',
	
);

$build->create_build_script;
