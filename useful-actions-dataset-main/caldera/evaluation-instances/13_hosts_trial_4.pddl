;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 13 hosts, 13 user, 2 admin per host, 2 active account per host
(define (problem p13_hosts_trial_4)
(:domain caldera)
(:objects id_fvRat id_gdRat id_fxRat id_fpRat id_ftRat id_fsRat id_gaRat id_gbRat id_fyRat id_gcRat id_fwRat id_frRat id_fzRat id_fuRat - ObservedRat 
 id_gwFile id_guFile id_gvFile id_gzFile id_hdFile id_grFile id_gsFile id_gtFile id_gxFile id_gyFile id_haFile id_hcFile id_hbFile - ObservedFile 
 id_beDomainUser id_bmDomainUser id_baDomainUser id_buDomainUser id_oDomainUser id_cDomainUser id_byDomainUser id_sDomainUser id_gDomainUser id_biDomainUser id_wDomainUser id_bqDomainUser id_kDomainUser - ObservedDomainUser 
 id_ckTimeDelta id_cdTimeDelta id_cyTimeDelta id_fjTimeDelta id_eaTimeDelta id_crTimeDelta id_evTimeDelta id_dfTimeDelta id_dtTimeDelta id_fcTimeDelta id_ehTimeDelta id_eoTimeDelta id_dmTimeDelta - ObservedTimeDelta 
 str__alpha str__bx str__q str__bk str__john str__em str__ek str__y str__co str__v str__cn str__jennifer str__richard str__fm str__elizabeth str__ff str__u str__bs str__patricia str__ci str__bc str__bd str__james str__dk str__er str__bh str__william str__di str__david str__dd str__ey str__cw str__cg str__dp str__n str__michael str__m str__i str__bt str__dy str__z str__fn str__fq str__j str__b str__cp str__bp str__fg str__fo str__ca str__db str__ee str__mary str__barbara str__dr str__ez str__e str__dc str__bo str__ch str__dq str__et str__fh str__fa str__linda str__cb str__es str__cv str__ed str__ef str__dj str__el str__bg str__bw str__f str__bl str__dx str__cu str__r str__dw str__robert - string 
 id_ggShare id_glShare id_goShare id_geShare id_gpShare id_gqShare id_gfShare id_gkShare id_giShare id_gmShare id_gnShare id_ghShare id_gjShare - ObservedShare 
 num__120 num__133 num__77 num__113 num__92 num__126 num__105 num__141 num__56 num__99 num__119 num__57 num__84 num__71 num__140 num__134 num__91 num__70 num__78 num__106 num__112 num__63 num__85 num__127 num__98 num__64 - num 
 id_cjHost id_egHost id_enHost id_fbHost id_ccHost id_fiHost id_euHost id_deHost id_cxHost id_dlHost id_dsHost id_dzHost id_cqHost - ObservedHost 
 id_hiSchtask id_hqSchtask id_hfSchtask id_hkSchtask id_hnSchtask id_hoSchtask id_hgSchtask id_heSchtask id_hjSchtask id_hlSchtask id_hpSchtask id_hmSchtask id_hhSchtask - ObservedSchtask 
 id_aDomain - ObservedDomain 
 id_brDomainCredential id_lDomainCredential id_dDomainCredential id_hDomainCredential id_bnDomainCredential id_bfDomainCredential id_bjDomainCredential id_bvDomainCredential id_xDomainCredential id_bzDomainCredential id_bbDomainCredential id_tDomainCredential id_pDomainCredential - ObservedDomainCredential 
)
(:init     (knows id_euHost)
     (knows id_fpRat)
     (knows_property id_euHost pfqdn)
     (knows_property id_fpRat pexecutable)
     (knows_property id_fpRat phost)
     (mem_cached_domain_creds id_ccHost id_bjDomainCredential)
     (mem_cached_domain_creds id_ccHost id_bzDomainCredential)
     (mem_cached_domain_creds id_cjHost id_bjDomainCredential)
     (mem_cached_domain_creds id_cjHost id_dDomainCredential)
     (mem_cached_domain_creds id_cqHost id_bbDomainCredential)
     (mem_cached_domain_creds id_cqHost id_xDomainCredential)
     (mem_cached_domain_creds id_cxHost id_bbDomainCredential)
     (mem_cached_domain_creds id_cxHost id_lDomainCredential)
     (mem_cached_domain_creds id_deHost id_bjDomainCredential)
     (mem_cached_domain_creds id_deHost id_xDomainCredential)
     (mem_cached_domain_creds id_dlHost id_bjDomainCredential)
     (mem_cached_domain_creds id_dlHost id_bvDomainCredential)
     (mem_cached_domain_creds id_dsHost id_bzDomainCredential)
     (mem_cached_domain_creds id_dsHost id_hDomainCredential)
     (mem_cached_domain_creds id_dzHost id_pDomainCredential)
     (mem_cached_domain_creds id_dzHost id_xDomainCredential)
     (mem_cached_domain_creds id_egHost id_dDomainCredential)
     (mem_cached_domain_creds id_egHost id_lDomainCredential)
     (mem_cached_domain_creds id_enHost id_bjDomainCredential)
     (mem_cached_domain_creds id_enHost id_bnDomainCredential)
     (mem_cached_domain_creds id_euHost id_bnDomainCredential)
     (mem_cached_domain_creds id_euHost id_hDomainCredential)
     (mem_cached_domain_creds id_fbHost id_bbDomainCredential)
     (mem_cached_domain_creds id_fbHost id_bvDomainCredential)
     (mem_cached_domain_creds id_fiHost id_pDomainCredential)
     (mem_cached_domain_creds id_fiHost id_tDomainCredential)
     (mem_domain_user_admins id_ccHost id_biDomainUser)
     (mem_domain_user_admins id_ccHost id_wDomainUser)
     (mem_domain_user_admins id_cjHost id_biDomainUser)
     (mem_domain_user_admins id_cjHost id_gDomainUser)
     (mem_domain_user_admins id_cqHost id_baDomainUser)
     (mem_domain_user_admins id_cqHost id_bmDomainUser)
     (mem_domain_user_admins id_cxHost id_beDomainUser)
     (mem_domain_user_admins id_cxHost id_biDomainUser)
     (mem_domain_user_admins id_deHost id_beDomainUser)
     (mem_domain_user_admins id_deHost id_wDomainUser)
     (mem_domain_user_admins id_dlHost id_byDomainUser)
     (mem_domain_user_admins id_dlHost id_kDomainUser)
     (mem_domain_user_admins id_dsHost id_biDomainUser)
     (mem_domain_user_admins id_dsHost id_buDomainUser)
     (mem_domain_user_admins id_dzHost id_baDomainUser)
     (mem_domain_user_admins id_dzHost id_oDomainUser)
     (mem_domain_user_admins id_egHost id_buDomainUser)
     (mem_domain_user_admins id_egHost id_byDomainUser)
     (mem_domain_user_admins id_enHost id_bmDomainUser)
     (mem_domain_user_admins id_enHost id_buDomainUser)
     (mem_domain_user_admins id_euHost id_beDomainUser)
     (mem_domain_user_admins id_euHost id_gDomainUser)
     (mem_domain_user_admins id_fbHost id_baDomainUser)
     (mem_domain_user_admins id_fbHost id_bqDomainUser)
     (mem_domain_user_admins id_fiHost id_bmDomainUser)
     (mem_domain_user_admins id_fiHost id_bqDomainUser)
     (mem_hosts id_aDomain id_ccHost)
     (mem_hosts id_aDomain id_cjHost)
     (mem_hosts id_aDomain id_cqHost)
     (mem_hosts id_aDomain id_cxHost)
     (mem_hosts id_aDomain id_deHost)
     (mem_hosts id_aDomain id_dlHost)
     (mem_hosts id_aDomain id_dsHost)
     (mem_hosts id_aDomain id_dzHost)
     (mem_hosts id_aDomain id_egHost)
     (mem_hosts id_aDomain id_enHost)
     (mem_hosts id_aDomain id_euHost)
     (mem_hosts id_aDomain id_fbHost)
     (mem_hosts id_aDomain id_fiHost)
     (prop_cred id_baDomainUser id_bbDomainCredential)
     (prop_cred id_beDomainUser id_bfDomainCredential)
     (prop_cred id_biDomainUser id_bjDomainCredential)
     (prop_cred id_bmDomainUser id_bnDomainCredential)
     (prop_cred id_bqDomainUser id_brDomainCredential)
     (prop_cred id_buDomainUser id_bvDomainCredential)
     (prop_cred id_byDomainUser id_bzDomainCredential)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_cred id_sDomainUser id_tDomainCredential)
     (prop_cred id_wDomainUser id_xDomainCredential)
     (prop_dc id_ccHost no)
     (prop_dc id_cjHost no)
     (prop_dc id_cqHost no)
     (prop_dc id_cxHost no)
     (prop_dc id_deHost no)
     (prop_dc id_dlHost yes)
     (prop_dc id_dsHost no)
     (prop_dc id_dzHost no)
     (prop_dc id_egHost no)
     (prop_dc id_enHost no)
     (prop_dc id_euHost yes)
     (prop_dc id_fbHost no)
     (prop_dc id_fiHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_ccHost str__cg)
     (prop_dns_domain_name id_cjHost str__cn)
     (prop_dns_domain_name id_cqHost str__cu)
     (prop_dns_domain_name id_cxHost str__db)
     (prop_dns_domain_name id_deHost str__di)
     (prop_dns_domain_name id_dlHost str__dp)
     (prop_dns_domain_name id_dsHost str__dw)
     (prop_dns_domain_name id_dzHost str__ed)
     (prop_dns_domain_name id_egHost str__ek)
     (prop_dns_domain_name id_enHost str__er)
     (prop_dns_domain_name id_euHost str__ey)
     (prop_dns_domain_name id_fbHost str__ff)
     (prop_dns_domain_name id_fiHost str__fm)
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
     (prop_domain id_ccHost id_aDomain)
     (prop_domain id_cjHost id_aDomain)
     (prop_domain id_cqHost id_aDomain)
     (prop_domain id_cxHost id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
     (prop_domain id_deHost id_aDomain)
     (prop_domain id_dlHost id_aDomain)
     (prop_domain id_dsHost id_aDomain)
     (prop_domain id_dzHost id_aDomain)
     (prop_domain id_egHost id_aDomain)
     (prop_domain id_enHost id_aDomain)
     (prop_domain id_euHost id_aDomain)
     (prop_domain id_fbHost id_aDomain)
     (prop_domain id_fiHost id_aDomain)
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
     (prop_elevated id_fpRat yes)
     (prop_executable id_fpRat str__fq)
     (prop_fqdn id_ccHost str__ch)
     (prop_fqdn id_cjHost str__co)
     (prop_fqdn id_cqHost str__cv)
     (prop_fqdn id_cxHost str__dc)
     (prop_fqdn id_deHost str__dj)
     (prop_fqdn id_dlHost str__dq)
     (prop_fqdn id_dsHost str__dx)
     (prop_fqdn id_dzHost str__ee)
     (prop_fqdn id_egHost str__el)
     (prop_fqdn id_enHost str__es)
     (prop_fqdn id_euHost str__ez)
     (prop_fqdn id_fbHost str__fg)
     (prop_fqdn id_fiHost str__fn)
     (prop_host id_cdTimeDelta id_ccHost)
     (prop_host id_ckTimeDelta id_cjHost)
     (prop_host id_crTimeDelta id_cqHost)
     (prop_host id_cyTimeDelta id_cxHost)
     (prop_host id_dfTimeDelta id_deHost)
     (prop_host id_dmTimeDelta id_dlHost)
     (prop_host id_dtTimeDelta id_dsHost)
     (prop_host id_eaTimeDelta id_dzHost)
     (prop_host id_ehTimeDelta id_egHost)
     (prop_host id_eoTimeDelta id_enHost)
     (prop_host id_evTimeDelta id_euHost)
     (prop_host id_fcTimeDelta id_fbHost)
     (prop_host id_fjTimeDelta id_fiHost)
     (prop_host id_fpRat id_euHost)
     (prop_hostname id_ccHost str__ci)
     (prop_hostname id_cjHost str__cp)
     (prop_hostname id_cqHost str__cw)
     (prop_hostname id_cxHost str__dd)
     (prop_hostname id_deHost str__dk)
     (prop_hostname id_dlHost str__dr)
     (prop_hostname id_dsHost str__dy)
     (prop_hostname id_dzHost str__ef)
     (prop_hostname id_egHost str__em)
     (prop_hostname id_enHost str__et)
     (prop_hostname id_euHost str__fa)
     (prop_hostname id_fbHost str__fh)
     (prop_hostname id_fiHost str__fo)
     (prop_is_group id_baDomainUser no)
     (prop_is_group id_beDomainUser no)
     (prop_is_group id_biDomainUser no)
     (prop_is_group id_bmDomainUser no)
     (prop_is_group id_bqDomainUser no)
     (prop_is_group id_buDomainUser no)
     (prop_is_group id_byDomainUser no)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_is_group id_sDomainUser no)
     (prop_is_group id_wDomainUser no)
     (prop_microseconds id_cdTimeDelta num__57)
     (prop_microseconds id_ckTimeDelta num__64)
     (prop_microseconds id_crTimeDelta num__71)
     (prop_microseconds id_cyTimeDelta num__78)
     (prop_microseconds id_dfTimeDelta num__85)
     (prop_microseconds id_dmTimeDelta num__92)
     (prop_microseconds id_dtTimeDelta num__99)
     (prop_microseconds id_eaTimeDelta num__106)
     (prop_microseconds id_ehTimeDelta num__113)
     (prop_microseconds id_eoTimeDelta num__120)
     (prop_microseconds id_evTimeDelta num__127)
     (prop_microseconds id_fcTimeDelta num__134)
     (prop_microseconds id_fjTimeDelta num__141)
     (prop_password id_bbDomainCredential str__bc)
     (prop_password id_bfDomainCredential str__bg)
     (prop_password id_bjDomainCredential str__bk)
     (prop_password id_bnDomainCredential str__bo)
     (prop_password id_brDomainCredential str__bs)
     (prop_password id_bvDomainCredential str__bw)
     (prop_password id_bzDomainCredential str__ca)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_password id_tDomainCredential str__u)
     (prop_password id_xDomainCredential str__y)
     (prop_seconds id_cdTimeDelta num__56)
     (prop_seconds id_ckTimeDelta num__63)
     (prop_seconds id_crTimeDelta num__70)
     (prop_seconds id_cyTimeDelta num__77)
     (prop_seconds id_dfTimeDelta num__84)
     (prop_seconds id_dmTimeDelta num__91)
     (prop_seconds id_dtTimeDelta num__98)
     (prop_seconds id_eaTimeDelta num__105)
     (prop_seconds id_ehTimeDelta num__112)
     (prop_seconds id_eoTimeDelta num__119)
     (prop_seconds id_evTimeDelta num__126)
     (prop_seconds id_fcTimeDelta num__133)
     (prop_seconds id_fjTimeDelta num__140)
     (prop_sid id_baDomainUser str__bd)
     (prop_sid id_beDomainUser str__bh)
     (prop_sid id_biDomainUser str__bl)
     (prop_sid id_bmDomainUser str__bp)
     (prop_sid id_bqDomainUser str__bt)
     (prop_sid id_buDomainUser str__bx)
     (prop_sid id_byDomainUser str__cb)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_sid id_sDomainUser str__v)
     (prop_sid id_wDomainUser str__z)
     (prop_timedelta id_ccHost id_cdTimeDelta)
     (prop_timedelta id_cjHost id_ckTimeDelta)
     (prop_timedelta id_cqHost id_crTimeDelta)
     (prop_timedelta id_cxHost id_cyTimeDelta)
     (prop_timedelta id_deHost id_dfTimeDelta)
     (prop_timedelta id_dlHost id_dmTimeDelta)
     (prop_timedelta id_dsHost id_dtTimeDelta)
     (prop_timedelta id_dzHost id_eaTimeDelta)
     (prop_timedelta id_egHost id_ehTimeDelta)
     (prop_timedelta id_enHost id_eoTimeDelta)
     (prop_timedelta id_euHost id_evTimeDelta)
     (prop_timedelta id_fbHost id_fcTimeDelta)
     (prop_timedelta id_fiHost id_fjTimeDelta)
     (prop_user id_bbDomainCredential id_baDomainUser)
     (prop_user id_bfDomainCredential id_beDomainUser)
     (prop_user id_bjDomainCredential id_biDomainUser)
     (prop_user id_bnDomainCredential id_bmDomainUser)
     (prop_user id_brDomainCredential id_bqDomainUser)
     (prop_user id_bvDomainCredential id_buDomainUser)
     (prop_user id_bzDomainCredential id_byDomainUser)
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
     (prop_username id_gDomainUser str__mary)
     (prop_username id_kDomainUser str__john)
     (prop_username id_oDomainUser str__patricia)
     (prop_username id_sDomainUser str__robert)
     (prop_username id_wDomainUser str__linda)
     (prop_windows_domain id_aDomain str__alpha)
)
(:goal   (and 
     (prop_host id_fuRat id_cqHost)
     (prop_host id_fvRat id_cjHost)
     (prop_host id_gdRat id_egHost)
     (prop_host id_fxRat id_enHost)
     (prop_host id_ftRat id_fbHost)
     (prop_host id_fsRat id_ccHost)
     (prop_host id_gaRat id_fiHost)
     (prop_host id_gbRat id_deHost)
     (prop_host id_fyRat id_cxHost)
     (prop_host id_gcRat id_dlHost)
     (prop_host id_fwRat id_dsHost)
     (prop_host id_frRat id_dzHost)
)
)
)