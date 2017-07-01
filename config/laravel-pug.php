<?php return [

	/**
	 * Passthrough php-pug config options
	 * https://github.com/pug-php/pug/blob/master/src/Jade/Jade.php
	 */

	// Required for extending layouts
	'basedir' => resource_path('views'),

	// 'cache'              => null,
	// 'stream'             => null,
	'extension'          => array('.pug'),
	'prettyprint'        => false,
	'phpSingleLine'      => true,
	// 'keepBaseName'       => false,
	// 'allowMixinOverride' => true,
	// 'allowMixedIndent'   => true,
	// 'keepNullAttributes' => false,
	// 'restrictedScope'    => false,
	// 'singleQuote'        => false,
	// 'filterAutoLoad'     => true,
	'indentSize'         => 2,
	'indentChar'         => ' ',
	// 'customKeywords'     => array(),
	// 'classAttribute'     => null,
];
