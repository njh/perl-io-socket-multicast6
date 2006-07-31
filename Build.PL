use Module::Build;

my $build = Module::Build->new
(
	module_name => 'IO::Socket::Multicast6',
	license => 'perl',
	build_requires => {
		'Module::Build' => '0.20'
	},
	requires => {
		'perl'	=> '5.5.0',
		'IO::Socket::INET6' => '2.51',
		'Test' => '1.00',
	},
	
	create_makefile_pl => 'passthrough',
	
);

$build->create_build_script;
