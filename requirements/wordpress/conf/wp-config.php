<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'jcarlen' );

/** Database password */
define( 'DB_PASSWORD', 'password123' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Wy<4o-Ysn18U_oVe{c?VYo!-D#-)t.S|(WQhwAH3QEMK!DN5F20JU$^,s$/njQI.');
	define('SECURE_AUTH_KEY',  '9fQ2y9/o8IG-X|;f+k>|:%){9q`G6FF`jf|}7D_3:wvpQeRO9M4MJ0@hh0Za/S :');
	define('LOGGED_IN_KEY',    ':-ycZgxgvQ+NUwOtg@9os96/ybu2CLW{0Yb+N]Je+],aLjl z?RLRo_J,0@ CBpz');
	define('NONCE_KEY',        'xo*bVq9+(u7n:7QA+mVVY{yo5Q94GF.dbk :cN)%F&N{MA6_/u+;O01Ps^S?s5~a');
	define('AUTH_SALT',        'wKR UYFm8MiL!nv:@@+|]@C_T+}:EX|F:9^OE4|W[f Y,-,$>0h(wSil+|H+s({3');
	define('SECURE_AUTH_SALT', ';EC`Ng7STpT(:D.)6+zn;92yV2Vi[_5J:G(a=3M{_!BG.5v$!g,lT?^rt*yZR|~d');
	define('LOGGED_IN_SALT',   '@4k/iJfC:p>!qi$.-Qq4UU>q:dMn[Ou{-s:f4Z8L(*-/ZxD_.?x1CZ+-zbgO Ut,');
	define('NONCE_SALT',       'J-w</+p9Y0k-uT2PLgD7a,N7]*#@3(@I^e&6^5yHO*d.lP=|=S_%w?Cc2o%.+Z/m');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';