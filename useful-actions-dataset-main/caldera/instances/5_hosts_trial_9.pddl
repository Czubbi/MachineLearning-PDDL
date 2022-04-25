;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 5 hosts, 16 user, 2 admin per host, 5 active account per host
(define (problem p5_hosts_trial_9)
(:domain caldera)
(:objects id_ddTimeDelta id_cpTimeDelta id_cwTimeDelta id_dkTimeDelta id_drTimeDelta - ObservedTimeDelta 
 id_ehFile id_egFile id_eeFile id_efFile id_eiFile - ObservedFile 
 id_dqHost id_djHost id_coHost id_dcHost id_cvHost - ObservedHost 
 id_emSchtask id_enSchtask id_ekSchtask id_ejSchtask id_elSchtask - ObservedSchtask 
 id_xDomainCredential id_hDomainCredential id_bjDomainCredential id_cdDomainCredential id_bbDomainCredential id_tDomainCredential id_chDomainCredential id_clDomainCredential id_dDomainCredential id_bvDomainCredential id_lDomainCredential id_brDomainCredential id_bfDomainCredential id_bnDomainCredential id_bzDomainCredential id_pDomainCredential - ObservedDomainCredential 
 id_edShare id_ebShare id_ecShare id_eaShare id_dzShare - ObservedShare 
 id_baDomainUser id_bqDomainUser id_buDomainUser id_gDomainUser id_sDomainUser id_byDomainUser id_ccDomainUser id_oDomainUser id_cgDomainUser id_ckDomainUser id_wDomainUser id_beDomainUser id_cDomainUser id_kDomainUser id_biDomainUser id_bmDomainUser - ObservedDomainUser 
 num__69 num__82 num__90 num__75 num__83 num__68 num__76 num__97 num__96 num__89 - num 
 str__bt str__john str__bh str__bs str__dw str__bg str__dn str__cm str__dp str__ci str__cu str__cs str__e str__ca str__j str__dy str__william str__b str__cb str__m str__f str__z str__bl str__charles str__i str__q str__bk str__dv str__bo str__maria str__james str__dg str__barbara str__du str__da str__u str__bx str__linda str__db str__cj str__michael str__robert str__bp str__ce str__v str__n str__r str__do str__bc str__alpha str__cz str__mary str__susan str__cn str__david str__dh str__jennifer str__bw str__y str__bd str__di str__richard str__patricia str__cf str__elizabeth str__ct - string 
 id_aDomain - ObservedDomain 
 id_dxRat id_eqRat id_erRat id_eoRat id_esRat id_epRat - ObservedRat 
)
(:init     (knows id_djHost)
     (knows id_dxRat)
     (knows_property id_djHost pfqdn)
     (knows_property id_dxRat pexecutable)
     (knows_property id_dxRat phost)
     (mem_cached_domain_creds id_coHost id_brDomainCredential)
     (mem_cached_domain_creds id_coHost id_bzDomainCredential)
     (mem_cached_domain_creds id_coHost id_cdDomainCredential)
     (mem_cached_domain_creds id_coHost id_pDomainCredential)
     (mem_cached_domain_creds id_coHost id_xDomainCredential)
     (mem_cached_domain_creds id_cvHost id_bfDomainCredential)
     (mem_cached_domain_creds id_cvHost id_bnDomainCredential)
     (mem_cached_domain_creds id_cvHost id_bvDomainCredential)
     (mem_cached_domain_creds id_cvHost id_bzDomainCredential)
     (mem_cached_domain_creds id_cvHost id_lDomainCredential)
     (mem_cached_domain_creds id_dcHost id_bzDomainCredential)
     (mem_cached_domain_creds id_dcHost id_cdDomainCredential)
     (mem_cached_domain_creds id_dcHost id_chDomainCredential)
     (mem_cached_domain_creds id_dcHost id_clDomainCredential)
     (mem_cached_domain_creds id_dcHost id_lDomainCredential)
     (mem_cached_domain_creds id_djHost id_bvDomainCredential)
     (mem_cached_domain_creds id_djHost id_cdDomainCredential)
     (mem_cached_domain_creds id_djHost id_clDomainCredential)
     (mem_cached_domain_creds id_djHost id_dDomainCredential)
     (mem_cached_domain_creds id_djHost id_pDomainCredential)
     (mem_cached_domain_creds id_dqHost id_bfDomainCredential)
     (mem_cached_domain_creds id_dqHost id_bnDomainCredential)
     (mem_cached_domain_creds id_dqHost id_bvDomainCredential)
     (mem_cached_domain_creds id_dqHost id_bzDomainCredential)
     (mem_cached_domain_creds id_dqHost id_cdDomainCredential)
     (mem_domain_user_admins id_coHost id_gDomainUser)
     (mem_domain_user_admins id_coHost id_oDomainUser)
     (mem_domain_user_admins id_cvHost id_bqDomainUser)
     (mem_domain_user_admins id_cvHost id_cDomainUser)
     (mem_domain_user_admins id_dcHost id_cDomainUser)
     (mem_domain_user_admins id_dcHost id_wDomainUser)
     (mem_domain_user_admins id_djHost id_bmDomainUser)
     (mem_domain_user_admins id_djHost id_buDomainUser)
     (mem_domain_user_admins id_dqHost id_byDomainUser)
     (mem_domain_user_admins id_dqHost id_gDomainUser)
     (mem_hosts id_aDomain id_coHost)
     (mem_hosts id_aDomain id_cvHost)
     (mem_hosts id_aDomain id_dcHost)
     (mem_hosts id_aDomain id_djHost)
     (mem_hosts id_aDomain id_dqHost)
     (prop_cred id_baDomainUser id_bbDomainCredential)
     (prop_cred id_beDomainUser id_bfDomainCredential)
     (prop_cred id_biDomainUser id_bjDomainCredential)
     (prop_cred id_bmDomainUser id_bnDomainCredential)
     (prop_cred id_bqDomainUser id_brDomainCredential)
     (prop_cred id_buDomainUser id_bvDomainCredential)
     (prop_cred id_byDomainUser id_bzDomainCredential)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_ccDomainUser id_cdDomainCredential)
     (prop_cred id_cgDomainUser id_chDomainCredential)
     (prop_cred id_ckDomainUser id_clDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_cred id_sDomainUser id_tDomainCredential)
     (prop_cred id_wDomainUser id_xDomainCredential)
     (prop_dc id_coHost no)
     (prop_dc id_cvHost no)
     (prop_dc id_dcHost no)
     (prop_dc id_djHost yes)
     (prop_dc id_dqHost yes)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_coHost str__ct)
     (prop_dns_domain_name id_cvHost str__da)
     (prop_dns_domain_name id_dcHost str__dh)
     (prop_dns_domain_name id_djHost str__do)
     (prop_dns_domain_name id_dqHost str__dv)
     (prop_domain id_baDomainUser id_aDomain)
     (prop_domain id_bbDomainCredential id_aDomain)
     (prop_domain id_beDomainUser id_aDomain)
     (prop_domain id_bfDomainCredential id_aDomain)
     (prop_domain id_biDomainUser id_aDomain)
     (prop_domain id_bjDomainCredential id_aDomain)
     (prop_domain id_bmDomainUser id_aDomain)
     (prop_domain id_bnDomainCredential id_aDomain)
     (prop_domain id_bqDomainUser id_aDomain)
     (prop_domain id_brDomainCredential id_aDomain)
     (prop_domain id_buDomainUser id_aDomain)
     (prop_domain id_bvDomainCredential id_aDomain)
     (prop_domain id_byDomainUser id_aDomain)
     (prop_domain id_bzDomainCredential id_aDomain)
     (prop_domain id_cDomainUser id_aDomain)
     (prop_domain id_ccDomainUser id_aDomain)
     (prop_domain id_cdDomainCredential id_aDomain)
     (prop_domain id_cgDomainUser id_aDomain)
     (prop_domain id_chDomainCredential id_aDomain)
     (prop_domain id_ckDomainUser id_aDomain)
     (prop_domain id_clDomainCredential id_aDomain)
     (prop_domain id_coHost id_aDomain)
     (prop_domain id_cvHost id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
     (prop_domain id_dcHost id_aDomain)
     (prop_domain id_djHost id_aDomain)
     (prop_domain id_dqHost id_aDomain)
     (prop_domain id_gDomainUser id_aDomain)
     (prop_domain id_hDomainCredential id_aDomain)
     (prop_domain id_kDomainUser id_aDomain)
     (prop_domain id_lDomainCredential id_aDomain)
     (prop_domain id_oDomainUser id_aDomain)
     (prop_domain id_pDomainCredential id_aDomain)
     (prop_domain id_sDomainUser id_aDomain)
     (prop_domain id_tDomainCredential id_aDomain)
     (prop_domain id_wDomainUser id_aDomain)
     (prop_domain id_xDomainCredential id_aDomain)
     (prop_elevated id_dxRat yes)
     (prop_executable id_dxRat str__dy)
     (prop_fqdn id_coHost str__cu)
     (prop_fqdn id_cvHost str__db)
     (prop_fqdn id_dcHost str__di)
     (prop_fqdn id_djHost str__dp)
     (prop_fqdn id_dqHost str__dw)
     (prop_host id_cpTimeDelta id_coHost)
     (prop_host id_cwTimeDelta id_cvHost)
     (prop_host id_ddTimeDelta id_dcHost)
     (prop_host id_dkTimeDelta id_djHost)
     (prop_host id_drTimeDelta id_dqHost)
     (prop_host id_dxRat id_djHost)
     (prop_hostname id_coHost str__cs)
     (prop_hostname id_cvHost str__cz)
     (prop_hostname id_dcHost str__dg)
     (prop_hostname id_djHost str__dn)
     (prop_hostname id_dqHost str__du)
     (prop_is_group id_baDomainUser no)
     (prop_is_group id_beDomainUser no)
     (prop_is_group id_biDomainUser no)
     (prop_is_group id_bmDomainUser no)
     (prop_is_group id_bqDomainUser no)
     (prop_is_group id_buDomainUser no)
     (prop_is_group id_byDomainUser no)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_ccDomainUser no)
     (prop_is_group id_cgDomainUser no)
     (prop_is_group id_ckDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_is_group id_sDomainUser no)
     (prop_is_group id_wDomainUser no)
     (prop_microseconds id_cpTimeDelta num__69)
     (prop_microseconds id_cwTimeDelta num__76)
     (prop_microseconds id_ddTimeDelta num__83)
     (prop_microseconds id_dkTimeDelta num__90)
     (prop_microseconds id_drTimeDelta num__97)
     (prop_password id_bbDomainCredential str__bc)
     (prop_password id_bfDomainCredential str__bg)
     (prop_password id_bjDomainCredential str__bk)
     (prop_password id_bnDomainCredential str__bo)
     (prop_password id_brDomainCredential str__bs)
     (prop_password id_bvDomainCredential str__bw)
     (prop_password id_bzDomainCredential str__ca)
     (prop_password id_cdDomainCredential str__ce)
     (prop_password id_chDomainCredential str__ci)
     (prop_password id_clDomainCredential str__cm)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_password id_tDomainCredential str__u)
     (prop_password id_xDomainCredential str__y)
     (prop_seconds id_cpTimeDelta num__68)
     (prop_seconds id_cwTimeDelta num__75)
     (prop_seconds id_ddTimeDelta num__82)
     (prop_seconds id_dkTimeDelta num__89)
     (prop_seconds id_drTimeDelta num__96)
     (prop_sid id_baDomainUser str__bd)
     (prop_sid id_beDomainUser str__bh)
     (prop_sid id_biDomainUser str__bl)
     (prop_sid id_bmDomainUser str__bp)
     (prop_sid id_bqDomainUser str__bt)
     (prop_sid id_buDomainUser str__bx)
     (prop_sid id_byDomainUser str__cb)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_ccDomainUser str__cf)
     (prop_sid id_cgDomainUser str__cj)
     (prop_sid id_ckDomainUser str__cn)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_sid id_sDomainUser str__v)
     (prop_sid id_wDomainUser str__z)
     (prop_timedelta id_coHost id_cpTimeDelta)
     (prop_timedelta id_cvHost id_cwTimeDelta)
     (prop_timedelta id_dcHost id_ddTimeDelta)
     (prop_timedelta id_djHost id_dkTimeDelta)
     (prop_timedelta id_dqHost id_drTimeDelta)
     (prop_user id_bbDomainCredential id_baDomainUser)
     (prop_user id_bfDomainCredential id_beDomainUser)
     (prop_user id_bjDomainCredential id_biDomainUser)
     (prop_user id_bnDomainCredential id_bmDomainUser)
     (prop_user id_brDomainCredential id_bqDomainUser)
     (prop_user id_bvDomainCredential id_buDomainUser)
     (prop_user id_bzDomainCredential id_byDomainUser)
     (prop_user id_cdDomainCredential id_ccDomainUser)
     (prop_user id_chDomainCredential id_cgDomainUser)
     (prop_user id_clDomainCredential id_ckDomainUser)
     (prop_user id_dDomainCredential id_cDomainUser)
     (prop_user id_hDomainCredential id_gDomainUser)
     (prop_user id_lDomainCredential id_kDomainUser)
     (prop_user id_pDomainCredential id_oDomainUser)
     (prop_user id_tDomainCredential id_sDomainUser)
     (prop_user id_xDomainCredential id_wDomainUser)
     (prop_username id_baDomainUser str__michael)
     (prop_username id_beDomainUser str__barbara)
     (prop_username id_biDomainUser str__william)
     (prop_username id_bmDomainUser str__elizabeth)
     (prop_username id_bqDomainUser str__david)
     (prop_username id_buDomainUser str__jennifer)
     (prop_username id_byDomainUser str__richard)
     (prop_username id_cDomainUser str__james)
     (prop_username id_ccDomainUser str__maria)
     (prop_username id_cgDomainUser str__charles)
     (prop_username id_ckDomainUser str__susan)
     (prop_username id_gDomainUser str__mary)
     (prop_username id_kDomainUser str__john)
     (prop_username id_oDomainUser str__patricia)
     (prop_username id_sDomainUser str__robert)
     (prop_username id_wDomainUser str__linda)
     (prop_windows_domain id_aDomain str__alpha)
)
(:goal   (and 
     (prop_host id_epRat id_cvHost)
     (prop_host id_eoRat id_coHost)
     (prop_host id_esRat id_dqHost)
     (prop_host id_eqRat id_dcHost)
)
)
)