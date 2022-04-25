;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 6 hosts, 12 user, 2 admin per host, 3 active account per host
(define (problem p6_hosts_trial_13)
(:domain caldera)
(:objects id_dvShare id_dqShare id_drShare id_dtShare id_duShare id_dsShare - ObservedShare 
 id_kDomainUser id_wDomainUser id_beDomainUser id_bmDomainUser id_cDomainUser id_gDomainUser id_sDomainUser id_bqDomainUser id_buDomainUser id_oDomainUser id_baDomainUser id_biDomainUser - ObservedDomainUser 
 id_aDomain - ObservedDomain 
 id_ejSchtask id_elSchtask id_eiSchtask id_enSchtask id_emSchtask id_ekSchtask - ObservedSchtask 
 id_eaRat id_ebRat id_doRat id_dyRat id_dzRat id_dxRat id_dwRat - ObservedRat 
 id_ecFile id_egFile id_ehFile id_edFile id_eeFile id_efFile - ObservedFile 
 id_cfHost id_daHost id_dhHost id_cmHost id_byHost id_ctHost - ObservedHost 
 id_dbTimeDelta id_diTimeDelta id_cgTimeDelta id_cuTimeDelta id_bzTimeDelta id_cnTimeDelta - ObservedTimeDelta 
 id_hDomainCredential id_dDomainCredential id_bnDomainCredential id_pDomainCredential id_bbDomainCredential id_bjDomainCredential id_brDomainCredential id_tDomainCredential id_bvDomainCredential id_lDomainCredential id_bfDomainCredential id_xDomainCredential - ObservedDomainCredential 
 num__80 num__88 num__53 num__52 num__74 num__60 num__87 num__73 num__66 num__59 num__81 num__67 - num 
 str__v str__barbara str__james str__u str__i str__bd str__linda str__cr str__dg str__bw str__bh str__william str__bx str__dn str__bp str__david str__ce str__cx str__de str__dl str__bg str__bo str__robert str__mary str__ck str__cl str__alpha str__bc str__cy str__patricia str__cd str__q str__y str__john str__elizabeth str__dm str__cs str__j str__f str__cq str__cc str__b str__bs str__michael str__e str__n str__z str__jennifer str__dp str__bl str__cj str__df str__r str__m str__bk str__cz str__bt - string 
)
(:init     (knows id_dhHost)
     (knows id_doRat)
     (knows_property id_dhHost pfqdn)
     (knows_property id_doRat pexecutable)
     (knows_property id_doRat phost)
     (mem_cached_domain_creds id_byHost id_bjDomainCredential)
     (mem_cached_domain_creds id_byHost id_brDomainCredential)
     (mem_cached_domain_creds id_byHost id_bvDomainCredential)
     (mem_cached_domain_creds id_cfHost id_bjDomainCredential)
     (mem_cached_domain_creds id_cfHost id_dDomainCredential)
     (mem_cached_domain_creds id_cfHost id_lDomainCredential)
     (mem_cached_domain_creds id_cmHost id_bnDomainCredential)
     (mem_cached_domain_creds id_cmHost id_tDomainCredential)
     (mem_cached_domain_creds id_cmHost id_xDomainCredential)
     (mem_cached_domain_creds id_ctHost id_bbDomainCredential)
     (mem_cached_domain_creds id_ctHost id_brDomainCredential)
     (mem_cached_domain_creds id_ctHost id_bvDomainCredential)
     (mem_cached_domain_creds id_daHost id_bfDomainCredential)
     (mem_cached_domain_creds id_daHost id_hDomainCredential)
     (mem_cached_domain_creds id_daHost id_xDomainCredential)
     (mem_cached_domain_creds id_dhHost id_bnDomainCredential)
     (mem_cached_domain_creds id_dhHost id_brDomainCredential)
     (mem_cached_domain_creds id_dhHost id_dDomainCredential)
     (mem_domain_user_admins id_byHost id_bmDomainUser)
     (mem_domain_user_admins id_byHost id_cDomainUser)
     (mem_domain_user_admins id_cfHost id_bmDomainUser)
     (mem_domain_user_admins id_cfHost id_buDomainUser)
     (mem_domain_user_admins id_cmHost id_bqDomainUser)
     (mem_domain_user_admins id_cmHost id_cDomainUser)
     (mem_domain_user_admins id_ctHost id_kDomainUser)
     (mem_domain_user_admins id_ctHost id_wDomainUser)
     (mem_domain_user_admins id_daHost id_baDomainUser)
     (mem_domain_user_admins id_daHost id_sDomainUser)
     (mem_domain_user_admins id_dhHost id_bqDomainUser)
     (mem_domain_user_admins id_dhHost id_kDomainUser)
     (mem_hosts id_aDomain id_byHost)
     (mem_hosts id_aDomain id_cfHost)
     (mem_hosts id_aDomain id_cmHost)
     (mem_hosts id_aDomain id_ctHost)
     (mem_hosts id_aDomain id_daHost)
     (mem_hosts id_aDomain id_dhHost)
     (prop_cred id_baDomainUser id_bbDomainCredential)
     (prop_cred id_beDomainUser id_bfDomainCredential)
     (prop_cred id_biDomainUser id_bjDomainCredential)
     (prop_cred id_bmDomainUser id_bnDomainCredential)
     (prop_cred id_bqDomainUser id_brDomainCredential)
     (prop_cred id_buDomainUser id_bvDomainCredential)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_cred id_sDomainUser id_tDomainCredential)
     (prop_cred id_wDomainUser id_xDomainCredential)
     (prop_dc id_byHost no)
     (prop_dc id_cfHost no)
     (prop_dc id_cmHost no)
     (prop_dc id_ctHost no)
     (prop_dc id_daHost no)
     (prop_dc id_dhHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_byHost str__ce)
     (prop_dns_domain_name id_cfHost str__cl)
     (prop_dns_domain_name id_cmHost str__cs)
     (prop_dns_domain_name id_ctHost str__cz)
     (prop_dns_domain_name id_daHost str__dg)
     (prop_dns_domain_name id_dhHost str__dn)
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
     (prop_domain id_byHost id_aDomain)
     (prop_domain id_cDomainUser id_aDomain)
     (prop_domain id_cfHost id_aDomain)
     (prop_domain id_cmHost id_aDomain)
     (prop_domain id_ctHost id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
     (prop_domain id_daHost id_aDomain)
     (prop_domain id_dhHost id_aDomain)
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
     (prop_elevated id_doRat yes)
     (prop_executable id_doRat str__dp)
     (prop_fqdn id_byHost str__cd)
     (prop_fqdn id_cfHost str__ck)
     (prop_fqdn id_cmHost str__cr)
     (prop_fqdn id_ctHost str__cy)
     (prop_fqdn id_daHost str__df)
     (prop_fqdn id_dhHost str__dm)
     (prop_host id_bzTimeDelta id_byHost)
     (prop_host id_cgTimeDelta id_cfHost)
     (prop_host id_cnTimeDelta id_cmHost)
     (prop_host id_cuTimeDelta id_ctHost)
     (prop_host id_dbTimeDelta id_daHost)
     (prop_host id_diTimeDelta id_dhHost)
     (prop_host id_doRat id_dhHost)
     (prop_hostname id_byHost str__cc)
     (prop_hostname id_cfHost str__cj)
     (prop_hostname id_cmHost str__cq)
     (prop_hostname id_ctHost str__cx)
     (prop_hostname id_daHost str__de)
     (prop_hostname id_dhHost str__dl)
     (prop_is_group id_baDomainUser no)
     (prop_is_group id_beDomainUser no)
     (prop_is_group id_biDomainUser no)
     (prop_is_group id_bmDomainUser no)
     (prop_is_group id_bqDomainUser no)
     (prop_is_group id_buDomainUser no)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_is_group id_sDomainUser no)
     (prop_is_group id_wDomainUser no)
     (prop_microseconds id_bzTimeDelta num__52)
     (prop_microseconds id_cgTimeDelta num__59)
     (prop_microseconds id_cnTimeDelta num__66)
     (prop_microseconds id_cuTimeDelta num__73)
     (prop_microseconds id_dbTimeDelta num__80)
     (prop_microseconds id_diTimeDelta num__87)
     (prop_password id_bbDomainCredential str__bc)
     (prop_password id_bfDomainCredential str__bg)
     (prop_password id_bjDomainCredential str__bk)
     (prop_password id_bnDomainCredential str__bo)
     (prop_password id_brDomainCredential str__bs)
     (prop_password id_bvDomainCredential str__bw)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_password id_tDomainCredential str__u)
     (prop_password id_xDomainCredential str__y)
     (prop_seconds id_bzTimeDelta num__53)
     (prop_seconds id_cgTimeDelta num__60)
     (prop_seconds id_cnTimeDelta num__67)
     (prop_seconds id_cuTimeDelta num__74)
     (prop_seconds id_dbTimeDelta num__81)
     (prop_seconds id_diTimeDelta num__88)
     (prop_sid id_baDomainUser str__bd)
     (prop_sid id_beDomainUser str__bh)
     (prop_sid id_biDomainUser str__bl)
     (prop_sid id_bmDomainUser str__bp)
     (prop_sid id_bqDomainUser str__bt)
     (prop_sid id_buDomainUser str__bx)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_sid id_sDomainUser str__v)
     (prop_sid id_wDomainUser str__z)
     (prop_timedelta id_byHost id_bzTimeDelta)
     (prop_timedelta id_cfHost id_cgTimeDelta)
     (prop_timedelta id_cmHost id_cnTimeDelta)
     (prop_timedelta id_ctHost id_cuTimeDelta)
     (prop_timedelta id_daHost id_dbTimeDelta)
     (prop_timedelta id_dhHost id_diTimeDelta)
     (prop_user id_bbDomainCredential id_baDomainUser)
     (prop_user id_bfDomainCredential id_beDomainUser)
     (prop_user id_bjDomainCredential id_biDomainUser)
     (prop_user id_bnDomainCredential id_bmDomainUser)
     (prop_user id_brDomainCredential id_bqDomainUser)
     (prop_user id_bvDomainCredential id_buDomainUser)
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
     (prop_username id_cDomainUser str__james)
     (prop_username id_gDomainUser str__mary)
     (prop_username id_kDomainUser str__john)
     (prop_username id_oDomainUser str__patricia)
     (prop_username id_sDomainUser str__robert)
     (prop_username id_wDomainUser str__linda)
     (prop_windows_domain id_aDomain str__alpha)
)
(:goal   (and 
     (prop_host id_dwRat id_cfHost)
     (prop_host id_eaRat id_daHost)
     (prop_host id_ebRat id_byHost)
     (prop_host id_dyRat id_cmHost)
     (prop_host id_dzRat id_ctHost)
)
)
)