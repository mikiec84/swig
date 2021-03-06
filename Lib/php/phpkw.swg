/* -----------------------------------------------------------------------------
 * phpkw.swg
 * ----------------------------------------------------------------------------- */

#define PHPKW(x) %keywordwarn("'" `x` "' is a PHP keyword, renamed as 'c_" `x` "'",sourcefmt="%(lower)s",rename="c_%s") `x`

#define PHPCN(x) %keywordwarn("'" `x` "' is a PHP reserved class name, class renamed as 'c_" `x` "'",%$isclass,sourcefmt="%(lower)s",rename="c_%s") `x`

#define PHPBN1(x) %builtinwarn("'" `x` "' conflicts with a built-in name in PHP",sourcefmt="%(lower)s") `x`
#define PHPBN2(x) %builtinwarn("'" `x` "' conflicts with a built-in name in PHP") "::" `x`
#define PHPFN(x) %keywordwarn("'" `x` "' is a PHP built-in function, renamed as 'c_" `x` "'",sourcefmt="%(lower)s",%$isfunction,%$not %$ismember,rename="c_%s") `x`

/*
   From

     http://aspn.activestate.com/ASPN/docs/PHP/reserved.html
     http://php.net/manual/en/reserved.keywords.php

   and reviewed by Olly Betts.

   Further updates from the PHP manual on php.net.
*/

/* We classify these as kw since PHP will not run if used globally. */
/* "You cannot use any of the following words as constants, class names,
 * function or method names. Using them as variable names is generally OK, but
 * could lead to confusion."
 */
/* case insensitive */
PHPKW(__halt_compiler);
PHPKW(abstract);
PHPKW(and);
PHPKW(array);
PHPKW(as);
PHPKW(break);
PHPKW(case);
PHPKW(catch);
PHPKW(class);
PHPKW(clone);
PHPKW(const);
PHPKW(continue);
PHPKW(declare);
PHPKW(default);
PHPKW(die); // "Language construct"
PHPKW(do);
PHPKW(echo); // "Language construct"
PHPKW(else);
PHPKW(elseif);
PHPKW(empty); // "Language construct"
PHPKW(enddeclare);
PHPKW(endfor);
PHPKW(endforeach);
PHPKW(endif);
PHPKW(endswitch);
PHPKW(endwhile);
PHPKW(eval); // "Language construct"
PHPKW(exit); // "Language construct"
PHPKW(extends);
PHPKW(final);
PHPKW(for);
PHPKW(foreach);
PHPKW(function);
PHPKW(global);
PHPKW(goto); // As of PHP5.3
PHPKW(if);
PHPKW(implements);
PHPKW(include); // "Language construct"
PHPKW(include_once); // "Language construct"
PHPKW(instanceof);
PHPKW(interface);
PHPKW(isset); // "Language construct"
PHPKW(list); // "Language construct"
PHPKW(namespace); // As of PHP5.3
PHPKW(new);
PHPKW(or);
PHPKW(print); // "Language construct"
PHPKW(private);
PHPKW(protected);
PHPKW(public);
PHPKW(require); // "Language construct"
PHPKW(require_once); // "Language construct"
PHPKW(return); // "Language construct"
PHPKW(static);
PHPKW(switch);
PHPKW(throw);
PHPKW(try);
PHPKW(unset); // "Language construct"
PHPKW(use);
PHPKW(var);
PHPKW(while);
PHPKW(xor);
// Compile-time constants
PHPKW(__CLASS__);
PHPKW(__DIR__); // As of PHP5.3
PHPKW(__FILE__);
PHPKW(__FUNCTION__);
PHPKW(__METHOD__);
PHPKW(__NAMESPACE__); // As of PHP5.3
PHPKW(__LINE__);

/* We classify these as built-in names since they conflict, but PHP still runs */

/* Type 1: case insensitive */
PHPBN1(__sleep);
PHPBN1(__wakeup);
PHPBN1(not);
PHPBN1(parent);
PHPBN1(virtual);
PHPBN1(NULL);
PHPBN1(TRUE);
PHPBN1(FALSE);

/* Type 2: case sensitive */
/* "Core Predefined Constants" from http://uk2.php.net/manual/en/reserved.constants.php */
PHPBN2(E_ALL);
PHPBN2(E_ERROR);
PHPBN2(E_PARSE);
PHPBN2(E_WARNING);
PHPBN2(E_NOTICE);
PHPBN2(E_CORE_ERROR);
PHPBN2(E_CORE_WARNING);
PHPBN2(E_COMPILE_ERROR);
PHPBN2(E_COMPILE_WARNING);
PHPBN2(E_USER_ERROR);
PHPBN2(E_USER_WARNING);
PHPBN2(E_USER_NOTICE);
PHPBN2(E_DEPRECATED); // As of PHP 5.3
PHPBN2(E_USER_DEPRECATED); // As of PHP 5.3
PHPBN2(PHP_OS);
PHPBN2(PHP_VERSION);
PHPBN2(PHP_SAPI);
PHPBN2(PHP_EOL);
PHPBN2(PHP_INT_MAX);
PHPBN2(PHP_INT_SIZE);
PHPBN2(DEFAULT_INCLUDE_PATH);
PHPBN2(PEAR_INSTALL_DIR);
PHPBN2(PEAR_EXTENSION_DIR);
PHPBN2(PHP_EXTENSION_DIR);
PHPBN2(PHP_PREFIX);
PHPBN2(PHP_BINDIR);
PHPBN2(PHP_LIBDIR);
PHPBN2(PHP_DATADIR);
PHPBN2(PHP_SYSCONFDIR);
PHPBN2(PHP_LOCALSTATEDIR);
PHPBN2(PHP_CONFIG_FILE_PATH);
PHPBN2(PHP_CONFIG_FILE_SCAN_DIR);
PHPBN2(PHP_SHLIB_SUFFIX);
PHPBN2(PHP_OUTPUT_HANDLER_START);
PHPBN2(PHP_OUTPUT_HANDLER_CONT);
PHPBN2(PHP_OUTPUT_HANDLER_END);
PHPBN2(PHP_MAXPATHLEN); // As of PHP 5.3
/* These don't actually seem to be set (tested on Linux, I guess they're
 * Windows only?) */
PHPBN2(PHP_WINDOWS_NT_DOMAIN_CONTROLLER); // As of PHP 5.3
PHPBN2(PHP_WINDOWS_NT_SERVER); // As of PHP 5.3
PHPBN2(PHP_WINDOWS_NT_WORKSTATION); // As of PHP 5.3
PHPBN2(PHP_WINDOWS_VERSION_BUILD); // As of PHP 5.3
PHPBN2(PHP_WINDOWS_VERSION_MAJOR); // As of PHP 5.3
PHPBN2(PHP_WINDOWS_VERSION_MINOR); // As of PHP 5.3
PHPBN2(PHP_WINDOWS_VERSION_PLATFORM); // As of PHP 5.3
PHPBN2(PHP_WINDOWS_VERSION_PRODUCTTYPE); // As of PHP 5.3
PHPBN2(PHP_WINDOWS_VERSION_SP_MAJOR); // As of PHP 5.3
PHPBN2(PHP_WINDOWS_VERSION_SP_MINOR); // As of PHP 5.3
PHPBN2(PHP_WINDOWS_VERSION_SUITEMASK); // As of PHP 5.3
/* "Standard Predefined Constants" from http://uk2.php.net/manual/en/reserved.constants.php */
PHPBN2(EXTR_OVERWRITE);
PHPBN2(EXTR_SKIP);
PHPBN2(EXTR_PREFIX_SAME);
PHPBN2(EXTR_PREFIX_ALL);
PHPBN2(EXTR_PREFIX_INVALID);
PHPBN2(EXTR_PREFIX_IF_EXISTS);
PHPBN2(EXTR_IF_EXISTS);
PHPBN2(SORT_ASC);
PHPBN2(SORT_DESC);
PHPBN2(SORT_REGULAR);
PHPBN2(SORT_NUMERIC);
PHPBN2(SORT_STRING);
PHPBN2(CASE_LOWER);
PHPBN2(CASE_UPPER);
PHPBN2(COUNT_NORMAL);
PHPBN2(COUNT_RECURSIVE);
PHPBN2(ASSERT_ACTIVE);
PHPBN2(ASSERT_CALLBACK);
PHPBN2(ASSERT_BAIL);
PHPBN2(ASSERT_WARNING);
PHPBN2(ASSERT_QUIET_EVAL);
PHPBN2(CONNECTION_ABORTED);
PHPBN2(CONNECTION_NORMAL);
PHPBN2(CONNECTION_TIMEOUT);
PHPBN2(INI_USER);
PHPBN2(INI_PERDIR);
PHPBN2(INI_SYSTEM);
PHPBN2(INI_ALL);
PHPBN2(INI_SCANNER_NORMAL); // As of PHP 5.3
PHPBN2(INI_SCANNER_RAW); // As of PHP 5.3
PHPBN2(M_E);
PHPBN2(M_LOG2E);
PHPBN2(M_LOG10E);
PHPBN2(M_LN2);
PHPBN2(M_LN10);
PHPBN2(M_PI);
PHPBN2(M_PI_2);
PHPBN2(M_PI_4);
PHPBN2(M_1_PI);
PHPBN2(M_2_PI);
PHPBN2(M_2_SQRTPI);
PHPBN2(M_SQRT2);
PHPBN2(M_SQRT1_2);
PHPBN2(M_EULER); // As of PHP 5.2
PHPBN2(M_LNPI); // As of PHP 5.2
PHPBN2(M_SQRT3); // As of PHP 5.2
PHPBN2(M_SQRTPI); // As of PHP 5.2
PHPBN2(CRYPT_SALT_LENGTH);
PHPBN2(CRYPT_STD_DES);
PHPBN2(CRYPT_EXT_DES);
PHPBN2(CRYPT_MD5);
PHPBN2(CRYPT_BLOWFISH);
PHPBN2(DIRECTORY_SEPARATOR);
PHPBN2(SEEK_SET);
PHPBN2(SEEK_CUR);
PHPBN2(SEEK_END);
PHPBN2(LOCK_SH);
PHPBN2(LOCK_EX);
PHPBN2(LOCK_UN);
PHPBN2(LOCK_NB);
PHPBN2(HTML_SPECIALCHARS);
PHPBN2(HTML_ENTITIES);
PHPBN2(ENT_COMPAT);
PHPBN2(ENT_QUOTES);
PHPBN2(ENT_NOQUOTES);
PHPBN2(INFO_GENERAL);
PHPBN2(INFO_CREDITS);
PHPBN2(INFO_CONFIGURATION);
PHPBN2(INFO_MODULES);
PHPBN2(INFO_ENVIRONMENT);
PHPBN2(INFO_VARIABLES);
PHPBN2(INFO_LICENSE);
PHPBN2(INFO_ALL);
PHPBN2(CREDITS_GROUP);
PHPBN2(CREDITS_GENERAL);
PHPBN2(CREDITS_SAPI);
PHPBN2(CREDITS_MODULES);
PHPBN2(CREDITS_DOCS);
PHPBN2(CREDITS_FULLPAGE);
PHPBN2(CREDITS_QA);
PHPBN2(CREDITS_ALL);
PHPBN2(STR_PAD_LEFT);
PHPBN2(STR_PAD_RIGHT);
PHPBN2(STR_PAD_BOTH);
PHPBN2(PATHINFO_DIRNAME);
PHPBN2(PATHINFO_BASENAME);
PHPBN2(PATHINFO_EXTENSION);
PHPBN2(PATHINFO_FILENAME); // As of PHP 5.2
PHPBN2(PATH_SEPARATOR);
PHPBN2(CHAR_MAX);
PHPBN2(LC_CTYPE);
PHPBN2(LC_NUMERIC);
PHPBN2(LC_TIME);
PHPBN2(LC_COLLATE);
PHPBN2(LC_MONETARY);
PHPBN2(LC_ALL);
PHPBN2(LC_MESSAGES);
PHPBN2(ABDAY_1);
PHPBN2(ABDAY_2);
PHPBN2(ABDAY_3);
PHPBN2(ABDAY_4);
PHPBN2(ABDAY_5);
PHPBN2(ABDAY_6);
PHPBN2(ABDAY_7);
PHPBN2(DAY_1);
PHPBN2(DAY_2);
PHPBN2(DAY_3);
PHPBN2(DAY_4);
PHPBN2(DAY_5);
PHPBN2(DAY_6);
PHPBN2(DAY_7);
PHPBN2(ABMON_1);
PHPBN2(ABMON_2);
PHPBN2(ABMON_3);
PHPBN2(ABMON_4);
PHPBN2(ABMON_5);
PHPBN2(ABMON_6);
PHPBN2(ABMON_7);
PHPBN2(ABMON_8);
PHPBN2(ABMON_9);
PHPBN2(ABMON_10);
PHPBN2(ABMON_11);
PHPBN2(ABMON_12);
PHPBN2(MON_1);
PHPBN2(MON_2);
PHPBN2(MON_3);
PHPBN2(MON_4);
PHPBN2(MON_5);
PHPBN2(MON_6);
PHPBN2(MON_7);
PHPBN2(MON_8);
PHPBN2(MON_9);
PHPBN2(MON_10);
PHPBN2(MON_11);
PHPBN2(MON_12);
PHPBN2(AM_STR);
PHPBN2(PM_STR);
PHPBN2(D_T_FMT);
PHPBN2(D_FMT);
PHPBN2(T_FMT);
PHPBN2(T_FMT_AMPM);
PHPBN2(ERA);
PHPBN2(ERA_YEAR);
PHPBN2(ERA_D_T_FMT);
PHPBN2(ERA_D_FMT);
PHPBN2(ERA_T_FMT);
PHPBN2(ALT_DIGITS);
PHPBN2(INT_CURR_SYMBOL);
PHPBN2(CURRENCY_SYMBOL);
PHPBN2(CRNCYSTR);
PHPBN2(MON_DECIMAL_POINT);
PHPBN2(MON_THOUSANDS_SEP);
PHPBN2(MON_GROUPING);
PHPBN2(POSITIVE_SIGN);
PHPBN2(NEGATIVE_SIGN);
PHPBN2(INT_FRAC_DIGITS);
PHPBN2(FRAC_DIGITS);
PHPBN2(P_CS_PRECEDES);
PHPBN2(P_SEP_BY_SPACE);
PHPBN2(N_CS_PRECEDES);
PHPBN2(N_SEP_BY_SPACE);
PHPBN2(P_SIGN_POSN);
PHPBN2(N_SIGN_POSN);
PHPBN2(DECIMAL_POINT);
PHPBN2(RADIXCHAR);
PHPBN2(THOUSANDS_SEP);
PHPBN2(THOUSEP);
PHPBN2(GROUPING);
PHPBN2(YESEXPR);
PHPBN2(NOEXPR);
PHPBN2(YESSTR);
PHPBN2(NOSTR);
PHPBN2(CODESET);
PHPBN2(LOG_EMERG);
PHPBN2(LOG_ALERT);
PHPBN2(LOG_CRIT);
PHPBN2(LOG_ERR);
PHPBN2(LOG_WARNING);
PHPBN2(LOG_NOTICE);
PHPBN2(LOG_INFO);
PHPBN2(LOG_DEBUG);
PHPBN2(LOG_KERN);
PHPBN2(LOG_USER);
PHPBN2(LOG_MAIL);
PHPBN2(LOG_DAEMON);
PHPBN2(LOG_AUTH);
PHPBN2(LOG_SYSLOG);
PHPBN2(LOG_LPR);
PHPBN2(LOG_NEWS);
PHPBN2(LOG_UUCP);
PHPBN2(LOG_CRON);
PHPBN2(LOG_AUTHPRIV);
PHPBN2(LOG_LOCAL0);
PHPBN2(LOG_LOCAL1);
PHPBN2(LOG_LOCAL2);
PHPBN2(LOG_LOCAL3);
PHPBN2(LOG_LOCAL4);
PHPBN2(LOG_LOCAL5);
PHPBN2(LOG_LOCAL6);
PHPBN2(LOG_LOCAL7);
PHPBN2(LOG_PID);
PHPBN2(LOG_CONS);
PHPBN2(LOG_ODELAY);
PHPBN2(LOG_NDELAY);
PHPBN2(LOG_NOWAIT);
PHPBN2(LOG_PERROR);

/* Added in PHP5 */
PHPBN2(E_STRICT);
PHPBN2(__COMPILER_HALT_OFFSET__);

/* Added in PHP 5.2 */
PHPBN2(PREG_BACKTRACK_LIMIT_ERROR);
PHPBN2(PREG_BAD_UTF8_ERROR);
PHPBN2(PREG_INTERNAL_ERROR);
PHPBN2(PREG_NO_ERROR);
PHPBN2(PREG_RECURSION_LIMIT_ERROR);
PHPBN2(UPLOAD_ERR_EXTENSION);
PHPBN2(STREAM_SHUT_RD);
PHPBN2(STREAM_SHUT_WR);
PHPBN2(STREAM_SHUT_RDWR);
PHPBN2(CURLE_FILESIZE_EXCEEDED);
PHPBN2(CURLE_FTP_SSL_FAILED);
PHPBN2(CURLE_LDAP_INVALID_URL);
PHPBN2(CURLFTPAUTH_DEFAULT);
PHPBN2(CURLFTPAUTH_SSL);
PHPBN2(CURLFTPAUTH_TLS);
PHPBN2(CURLFTPSSL_ALL);
PHPBN2(CURLFTPSSL_CONTROL);
PHPBN2(CURLFTPSSL_NONE);
PHPBN2(CURLFTPSSL_TRY);
PHPBN2(CURLOPT_FTP_SSL);
PHPBN2(CURLOPT_FTPSSLAUTH);
PHPBN2(CURLOPT_TCP_NODELAY); // Added in PHP 5.2.1
PHPBN2(CURLOPT_TIMEOUT_MS); // Added in PHP 5.2.3
PHPBN2(CURLOPT_CONNECTTIMEOUT_MS); // Added in PHP 5.2.3
PHPBN2(GMP_VERSION); // Added in PHP 5.2.2
PHPBN2(SWFTEXTFIELD_USEFONT);
PHPBN2(SWFTEXTFIELD_AUTOSIZE);
PHPBN2(SWF_SOUND_NOT_COMPRESSED);
PHPBN2(SWF_SOUND_ADPCM_COMPRESSED);
PHPBN2(SWF_SOUND_MP3_COMPRESSED);
PHPBN2(SWF_SOUND_NOT_COMPRESSED_LE);
PHPBN2(SWF_SOUND_NELLY_COMPRESSED);
PHPBN2(SWF_SOUND_5KHZ);
PHPBN2(SWF_SOUND_11KHZ);
PHPBN2(SWF_SOUND_22KHZ);
PHPBN2(SWF_SOUND_44KHZ);
PHPBN2(SWF_SOUND_8BITS);
PHPBN2(SWF_SOUND_16BITS);
PHPBN2(SWF_SOUND_MONO);
PHPBN2(SWF_SOUND_STEREO);
PHPBN2(OPENSSL_VERSION_NUMBER);
PHPBN2(SNMP_OID_OUTPUT_FULL);
PHPBN2(SNMP_OID_OUTPUT_NUMERIC);
PHPBN2(MSG_EAGAIN);
PHPBN2(MSG_ENOMSG);

/* Added in PHP 5.3 */
PHPBN2(CURLOPT_PROGRESSFUNCTION);
PHPBN2(IMG_FILTER_PIXELATE);
PHPBN2(JSON_ERROR_CTRL_CHAR);
PHPBN2(JSON_ERROR_DEPTH);
PHPBN2(JSON_ERROR_NONE);
PHPBN2(JSON_ERROR_STATE_MISMATCH);
PHPBN2(JSON_ERROR_SYNTAX);
PHPBN2(JSON_FORCE_OBJECT);
PHPBN2(JSON_HEX_TAG);
PHPBN2(JSON_HEX_AMP);
PHPBN2(JSON_HEX_APOS);
PHPBN2(JSON_HEX_QUOT);
PHPBN2(LDAP_OPT_NETWORK_TIMEOUT);
PHPBN2(LIBXML_LOADED_VERSION);
PHPBN2(PREG_BAD_UTF8_OFFSET_ERROR);
PHPBN2(BUS_ADRALN);
PHPBN2(BUS_ADRERR);
PHPBN2(BUS_OBJERR);
PHPBN2(CLD_CONTIUNED);
PHPBN2(CLD_DUMPED);
PHPBN2(CLD_EXITED);
PHPBN2(CLD_KILLED);
PHPBN2(CLD_STOPPED);
PHPBN2(CLD_TRAPPED);
PHPBN2(FPE_FLTDIV);
PHPBN2(FPE_FLTINV);
PHPBN2(FPE_FLTOVF);
PHPBN2(FPE_FLTRES);
PHPBN2(FPE_FLTSUB);
PHPBN2(FPE_FLTUND);
PHPBN2(FPE_INTDIV);
PHPBN2(FPE_INTOVF);
PHPBN2(ILL_BADSTK);
PHPBN2(ILL_COPROC);
PHPBN2(ILL_ILLADR);
PHPBN2(ILL_ILLOPC);
PHPBN2(ILL_ILLOPN);
PHPBN2(ILL_ILLTRP);
PHPBN2(ILL_PRVOPC);
PHPBN2(ILL_PRVREG);
PHPBN2(POLL_ERR);
PHPBN2(POLL_HUP);
PHPBN2(POLL_IN);
PHPBN2(POLL_MSG);
PHPBN2(POLL_OUT);
PHPBN2(POLL_PRI);
PHPBN2(SEGV_ACCERR);
PHPBN2(SEGV_MAPERR);
PHPBN2(SI_ASYNCIO);
PHPBN2(SI_KERNEL);
PHPBN2(SI_MESGQ);
PHPBN2(SI_NOINFO);
PHPBN2(SI_QUEUE);
PHPBN2(SI_SIGIO);
PHPBN2(SI_TIMER);
PHPBN2(SI_TKILL);
PHPBN2(SI_USER);
PHPBN2(SIG_BLOCK);
PHPBN2(SIG_SETMASK);
PHPBN2(SIG_UNBLOCK);
PHPBN2(TRAP_BRKPT);
PHPBN2(TRAP_TRACE);

/* Class names reserved by PHP */
/* case insensitive */
PHPCN(stdclass);
PHPCN(__php_incomplete_class);
PHPCN(directory);
/* Added in PHP5 (this list apparently depends which extensions you load by default). */
PHPCN(parent);
PHPCN(self);
PHPCN(exception);
PHPCN(php_user_filter);
PHPCN(errorexception);
PHPCN(xmlwriter);
PHPCN(libxmlerror);
PHPCN(simplexmlelement);
PHPCN(soapclient);
PHPCN(soapvar);
PHPCN(soapserver);
PHPCN(soapfault);
PHPCN(soapparam);
PHPCN(soapheader);
PHPCN(recursiveiteratoriterator);
PHPCN(filteriterator);
PHPCN(recursivefilteriterator);
PHPCN(parentiterator);
PHPCN(limititerator);
PHPCN(cachingiterator);
PHPCN(recursivecachingiterator);
PHPCN(iteratoriterator);
PHPCN(norewinditerator);
PHPCN(appenditerator);
PHPCN(infiniteiterator);
PHPCN(emptyiterator);
PHPCN(arrayobject);
PHPCN(arrayiterator);
PHPCN(recursivearrayiterator);
PHPCN(splfileinfo);
PHPCN(directoryiterator);
PHPCN(recursivedirectoryiterator);
PHPCN(splfileobject);
PHPCN(spltempfileobject);
PHPCN(simplexmliterator);
PHPCN(logicexception);
PHPCN(badfunctioncallexception);
PHPCN(badmethodcallexception);
PHPCN(domainexception);
PHPCN(invalidargumentexception);
PHPCN(lengthexception);
PHPCN(outofrangeexception);
PHPCN(runtimeexception);
PHPCN(outofboundsexception);
PHPCN(overflowexception);
PHPCN(rangeexception);
PHPCN(underflowexception);
PHPCN(unexpectedvalueexception);
PHPCN(splobjectstorage);
PHPCN(reflectionexception);
PHPCN(reflection);
PHPCN(reflectionfunction);
PHPCN(reflectionparameter);
PHPCN(reflectionmethod);
PHPCN(reflectionclass);
PHPCN(reflectionobject);
PHPCN(reflectionproperty);
PHPCN(reflectionextension);
PHPCN(domexception);
PHPCN(domstringlist);
PHPCN(domnamelist);
PHPCN(domimplementationlist);
PHPCN(domimplementationsource);
PHPCN(domimplementation);
PHPCN(domnode);
PHPCN(domnamespacenode);
PHPCN(domdocumentfragment);
PHPCN(domdocument);
PHPCN(domnodelist);
PHPCN(domnamednodemap);
PHPCN(domcharacterdata);
PHPCN(domattr);
PHPCN(domelement);
PHPCN(domtext);
PHPCN(domcomment);
PHPCN(domtypeinfo);
PHPCN(domuserdatahandler);
PHPCN(domdomerror);
PHPCN(domerrorhandler);
PHPCN(domlocator);
PHPCN(domconfiguration);
PHPCN(domcdatasection);
PHPCN(domdocumenttype);
PHPCN(domnotation);
PHPCN(domentity);
PHPCN(domentityreference);
PHPCN(domprocessinginstruction);
PHPCN(domstringextend);
PHPCN(domxpath);
PHPCN(xmlreader);
PHPCN(sqlitedatabase);
PHPCN(sqliteresult);
PHPCN(sqliteunbuffered);
PHPCN(sqliteexception);
PHPCN(datetime);

/* Built-in PHP functions (incomplete). */
/* Includes Array Functions - http://us3.php.net/manual/en/ref.array.php */
PHPFN(acos);
PHPFN(array_change_key_case);
PHPFN(array_chunk);
PHPFN(array_column);
PHPFN(array_combine);
PHPFN(array_count_values);
PHPFN(array_diff);
PHPFN(array_diff_assoc);
PHPFN(array_diff_key);
PHPFN(array_diff_uassoc);
PHPFN(array_diff_ukey);
PHPFN(array_fill);
PHPFN(array_fill_keys);
PHPFN(array_filter);
PHPFN(array_flip);
PHPFN(array_intersect);
PHPFN(array_intersect_assoc);
PHPFN(array_intersect_key);
PHPFN(array_intersect_uassoc);
PHPFN(array_intersect_ukey);
PHPFN(array_key_exists);
PHPFN(array_keys);
PHPFN(array_map);
PHPFN(array_merge);
PHPFN(array_merge_recursive);
PHPFN(array_multisort);
PHPFN(array_pad);
PHPFN(array_pop);
PHPFN(array_product);
PHPFN(array_push);
PHPFN(array_rand);
PHPFN(array_reduce);
PHPFN(array_replace);
PHPFN(array_replace_recursive);
PHPFN(array_reverse);
PHPFN(array_search);
PHPFN(array_shift);
PHPFN(array_slice);
PHPFN(array_splice);
PHPFN(array_sum);
PHPFN(array_udiff);
PHPFN(array_udiff_assoc);
PHPFN(array_udiff_uassoc);
PHPFN(array_uintersect);
PHPFN(array_uintersect_assoc);
PHPFN(array_uintersect_uassoc);
PHPFN(array_unique);
PHPFN(array_unshift);
PHPFN(array_values);
PHPFN(array_walk);
PHPFN(array_walk_recursive);
PHPFN(arsort);
PHPFN(asin);
PHPFN(asort);
PHPFN(atan);
PHPFN(atan2);
PHPFN(ceil);
PHPFN(compact);
PHPFN(cos);
PHPFN(cosh);
PHPFN(count);
PHPFN(current);
PHPFN(each);
PHPFN(end);
PHPFN(exp);
PHPFN(extract);
PHPFN(floor);
PHPFN(fmod);
PHPFN(in_array);
PHPFN(key);
PHPFN(key_exists);
PHPFN(krsort);
PHPFN(ksort);
PHPFN(log);
PHPFN(log10);
PHPFN(max);
PHPFN(min);
PHPFN(natcasesort);
PHPFN(natsort);
PHPFN(next);
PHPFN(pos);
PHPFN(pow);
PHPFN(prev);
PHPFN(range);
PHPFN(reset);
PHPFN(rsort);
PHPFN(shuffle);
PHPFN(sin);
PHPFN(sinh);
PHPFN(sizeof);
PHPFN(sort);
PHPFN(sqrt);
PHPFN(tan);
PHPFN(tanh);
PHPFN(uasort);
PHPFN(uksort);
PHPFN(usort);

#undef PHPKW
#undef PHPBN1
#undef PHPBN2
#undef PHPCN
#undef PHPFN
