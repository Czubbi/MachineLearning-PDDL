;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 7 hosts, 7 user, 2 admin per host, 2 active account per host
(define (problem p7_hosts_trial_4)
(:domain caldera)
(:objects id_aDomain - ObservedDomain 
 id_dDomainCredential id_bbDomainCredential id_tDomainCredential id_pDomainCredential id_lDomainCredential id_hDomainCredential id_xDomainCredential - ObservedDomainCredential 
 id_wDomainUser id_cDomainUser id_baDomainUser id_oDomainUser id_gDomainUser id_kDomainUser id_sDomainUser - ObservedDomainUser 
 id_dvShare id_dtShare id_dsShare id_duShare id_dwShare id_dxShare id_drShare - ObservedShare 
 id_dySchtask id_ebSchtask id_edSchtask id_dzSchtask id_eeSchtask id_ecSchtask id_eaSchtask - ObservedSchtask 
 id_cuHost id_bzHost id_cgHost id_beHost id_bsHost id_blHost id_cnHost - ObservedHost 
 id_djFile id_dfFile id_diFile id_deFile id_dgFile id_ddFile id_dhFile - ObservedFile 
 id_bfTimeDelta id_coTimeDelta id_caTimeDelta id_bmTimeDelta id_chTimeDelta id_cvTimeDelta id_btTimeDelta - ObservedTimeDelta 
 str__james str__robert str__by str__dc str__cl str__z str__b str__br str__alpha str__ck str__bc str__cy str__cm str__patricia str__bx str__bi str__linda str__v str__j str__ct str__bp str__bw str__f str__r str__m str__n str__ce str__u str__cr str__bq str__cs str__e str__q str__bj str__i str__y str__da str__bk str__bd str__cz str__mary str__john str__cd str__michael str__cf - string 
 id_dpRat id_dqRat id_dnRat id_dlRat id_dkRat id_dbRat id_doRat id_dmRat - ObservedRat 
 num__60 num__33 num__46 num__53 num__47 num__54 num__75 num__39 num__40 num__67 num__32 num__74 num__68 num__61 - num 
)
(:init     (knows id_cnHost)
     (knows id_dbRat)
     (knows_property id_cnHost pfqdn)
     (knows_property id_dbRat pexecutable)
     (knows_property id_dbRat phost)
     (mem_cached_domain_creds id_beHost id_dDomainCredential)
     (mem_cached_domain_creds id_beHost id_pDomainCredential)
     (mem_cached_domain_creds id_blHost id_lDomainCredential)
     (mem_cached_domain_creds id_blHost id_pDomainCredential)
     (mem_cached_domain_creds id_bsHost id_hDomainCredential)
     (mem_cached_domain_creds id_bsHost id_tDomainCredential)
     (mem_cached_domain_creds id_bzHost id_bbDomainCredential)
     (mem_cached_domain_creds id_bzHost id_lDomainCredential)
     (mem_cached_domain_creds id_cgHost id_pDomainCredential)
     (mem_cached_domain_creds id_cgHost id_tDomainCredential)
     (mem_cached_domain_creds id_cnHost id_bbDomainCredential)
     (mem_cached_domain_creds id_cnHost id_hDomainCredential)
     (mem_cached_domain_creds id_cuHost id_hDomainCredential)
     (mem_cached_domain_creds id_cuHost id_xDomainCredential)
     (mem_domain_user_admins id_beHost id_baDomainUser)
     (mem_domain_user_admins id_beHost id_cDomainUser)
     (mem_domain_user_admins id_blHost id_baDomainUser)
     (mem_domain_user_admins id_blHost id_kDomainUser)
     (mem_domain_user_admins id_bsHost id_kDomainUser)
     (mem_domain_user_admins id_bsHost id_sDomainUser)
     (mem_domain_user_admins id_bzHost id_cDomainUser)
     (mem_domain_user_admins id_bzHost id_kDomainUser)
     (mem_domain_user_admins id_cgHost id_baDomainUser)
     (mem_domain_user_admins id_cgHost id_wDomainUser)
     (mem_domain_user_admins id_cnHost id_sDomainUser)
     (mem_domain_user_admins id_cnHost id_wDomainUser)
     (mem_domain_user_admins id_cuHost id_baDomainUser)
     (mem_domain_user_admins id_cuHost id_oDomainUser)
     (mem_hosts id_aDomain id_beHost)
     (mem_hosts id_aDomain id_blHost)
     (mem_hosts id_aDomain id_bsHost)
     (mem_hosts id_aDomain id_bzHost)
     (mem_hosts id_aDomain id_cgHost)
     (mem_hosts id_aDomain id_cnHost)
     (mem_hosts id_aDomain id_cuHost)
     (prop_cred id_baDomainUser id_bbDomainCredential)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_cred id_sDomainUser id_tDomainCredential)
     (prop_cred id_wDomainUser id_xDomainCredential)
     (prop_dc id_beHost no)
     (prop_dc id_blHost no)
     (prop_dc id_bsHost no)
     (prop_dc id_bzHost no)
     (prop_dc id_cgHost no)
     (prop_dc id_cnHost no)
     (prop_dc id_cuHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_beHost str__bi)
     (prop_dns_domain_name id_blHost str__bp)
     (prop_dns_domain_name id_bsHost str__bw)
     (prop_dns_domain_name id_bzHost str__cd)
     (prop_dns_domain_name id_cgHost str__ck)
     (prop_dns_domain_name id_cnHost str__cr)
     (prop_dns_domain_name id_cuHost str__cy)
     (prop_domain id_baDomainUser id_aDomain)
     (prop_domain id_bbDomainCredential id_aDomain)
     (prop_domain id_beHost id_aDomain)
     (prop_domain id_blHost id_aDomain)
     (prop_domain id_bsHost id_aDomain)
     (prop_domain id_bzHost id_aDomain)
     (prop_domain id_cDomainUser id_aDomain)
     (prop_domain id_cgHost id_aDomain)
     (prop_domain id_cnHost id_aDomain)
     (prop_domain id_cuHost id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
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
     (prop_elevated id_dbRat yes)
     (prop_executable id_dbRat str__dc)
     (prop_fqdn id_beHost str__bj)
     (prop_fqdn id_blHost str__bq)
     (prop_fqdn id_bsHost str__bx)
     (prop_fqdn id_bzHost str__ce)
     (prop_fqdn id_cgHost str__cl)
     (prop_fqdn id_cnHost str__cs)
     (prop_fqdn id_cuHost str__cz)
     (prop_host id_bfTimeDelta id_beHost)
     (prop_host id_bmTimeDelta id_blHost)
     (prop_host id_btTimeDelta id_bsHost)
     (prop_host id_caTimeDelta id_bzHost)
     (prop_host id_chTimeDelta id_cgHost)
     (prop_host id_coTimeDelta id_cnHost)
     (prop_host id_cvTimeDelta id_cuHost)
     (prop_host id_dbRat id_cnHost)
     (prop_hostname id_beHost str__bk)
     (prop_hostname id_blHost str__br)
     (prop_hostname id_bsHost str__by)
     (prop_hostname id_bzHost str__cf)
     (prop_hostname id_cgHost str__cm)
     (prop_hostname id_cnHost str__ct)
     (prop_hostname id_cuHost str__da)
     (prop_is_group id_baDomainUser no)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_is_group id_sDomainUser no)
     (prop_is_group id_wDomainUser no)
     (prop_microseconds id_bfTimeDelta num__32)
     (prop_microseconds id_bmTimeDelta num__39)
     (prop_microseconds id_btTimeDelta num__46)
     (prop_microseconds id_caTimeDelta num__53)
     (prop_microseconds id_chTimeDelta num__60)
     (prop_microseconds id_coTimeDelta num__67)
     (prop_microseconds id_cvTimeDelta num__74)
     (prop_password id_bbDomainCredential str__bc)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_password id_tDomainCredential str__u)
     (prop_password id_xDomainCredential str__y)
     (prop_seconds id_bfTimeDelta num__33)
     (prop_seconds id_bmTimeDelta num__40)
     (prop_seconds id_btTimeDelta num__47)
     (prop_seconds id_caTimeDelta num__54)
     (prop_seconds id_chTimeDelta num__61)
     (prop_seconds id_coTimeDelta num__68)
     (prop_seconds id_cvTimeDelta num__75)
     (prop_sid id_baDomainUser str__bd)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_sid id_sDomainUser str__v)
     (prop_sid id_wDomainUser str__z)
     (prop_timedelta id_beHost id_bfTimeDelta)
     (prop_timedelta id_blHost id_bmTimeDelta)
     (prop_timedelta id_bsHost id_btTimeDelta)
     (prop_timedelta id_bzHost id_caTimeDelta)
     (prop_timedelta id_cgHost id_chTimeDelta)
     (prop_timedelta id_cnHost id_coTimeDelta)
     (prop_timedelta id_cuHost id_cvTimeDelta)
     (prop_user id_bbDomainCredential id_baDomainUser)
     (prop_user id_dDomainCredential id_cDomainUser)
     (prop_user id_hDomainCredential id_gDomainUser)
     (prop_user id_lDomainCredential id_kDomainUser)
     (prop_user id_pDomainCredential id_oDomainUser)
     (prop_user id_tDomainCredential id_sDomainUser)
     (prop_user id_xDomainCredential id_wDomainUser)
     (prop_username id_baDomainUser str__michael)
     (prop_username id_cDomainUser str__james)
     (prop_username id_gDomainUser str__mary)
     (prop_username id_kDomainUser str__john)
     (prop_username id_oDomainUser str__patricia)
     (prop_username id_sDomainUser str__robert)
     (prop_username id_wDomainUser str__linda)
     (prop_windows_domain id_aDomain str__alpha)
)
(:goal   (and 
     (prop_host id_dmRat id_blHost)
     (prop_host id_dpRat id_cuHost)
     (prop_host id_dqRat id_bzHost)
     (prop_host id_dnRat id_cgHost)
     (prop_host id_dlRat id_beHost)
     (prop_host id_dkRat id_bsHost)
)
)
)