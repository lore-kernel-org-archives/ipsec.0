Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570503;
	b=Ab81YI1TOMYLrfAjW7WNgZpgNZJ2jacFAErhq8CFJeOtp0f/9k0bKhWGj2v2BXFnQ7j+
	 4ebIvTNlnA7nNyEjxTudIHm4QqaeSu/x0xpyMaTisU5ipVGoHGVPVuRSBpvkoUSWSQZY0
	 J+sD3aX/yWI+HkMDf3ayuYPwrdlyMQSKFGjRUn6/P7+j8N5VCBC51XVXXjYtfAJbLmbtl
	 hJUCS2QN5FPkxW5f8gmb3fOabKuVoqhgjiJO/by6Sd+zRFPL07B7qRly6cclIWuNTiVCf
	 U6c5MBZf+ylf6hvwvefg7ZNyKWDMIGZ+3Bl0VISJFAxPkQrGxR5MNFC+NC5IuGNF4Eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570503;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XvLuXvliLRMeIs1SPB+JYLyNdyWnfhRVqk8q4r5H50w=;
	b=w1iCPKdpdny9E5N9xzvcl/b057FVK2/FyvpmHgrnEcXmjsUxnteRBee0wrOSRIY4SMn4
	 WtVdE4NyMEju4XiskrtAkbR+PGmGQ/qr/+EplcSPqzTpGGu3fM4e4ry00Aim3IqwNrgOF
	 x1X1PnSbKQip3C/rpkX88foVki5eyrBAwBkmTP8pCG2zHhOb8tKzUwHuxN4n1P+sHLCAV
	 zXM2IvAnDYf1IteIci1DOL6q3RAzZWWfPtNCgIQ9LouxFBL1+KQz6Pz1Qn3jXl53JjEEP
	 L7EG3/A5edjysfzefJrsDkEj4WJLfXlsW1koNhvY6YJeXDzUO0l13chIXSnRwA1madg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PGSR2PTj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.18
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013018.outbound.protection.outlook.com [40.93.201.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD9260A2608
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 01:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD9260A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PGSR2PTj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVRFWp6ABlem/sDAk9bZrHihTI5+5z9krceBGD/r2EDeiqGD2/XjUx/PrVcSiU9p34M5UZjtWz1sVw++fCzkO5+uVs0+AQs0qeZJzogIkDJW3/i/pcOMIdlyCgyItvalRMcGCnc85NXExZZ80uXRFvyMA3FzXoLgJ0GWncaJLdEVk3XdbI7VYe/G9YT5pXxg0ULPnm74qBYFpX/LNAC/uxm2e20SQXxintNHc/TXCJWAyRTVZ5WS9nkmN2vV/AbEVY4mPq84ILb+zwfKSCeLYeWjrtXIzASqQe9cBGGQ5eYRRpEx89XSobApHCy6d+W7Oqi+AdRP2JZp5CVoNkXeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvLuXvliLRMeIs1SPB+JYLyNdyWnfhRVqk8q4r5H50w=;
 b=bzWiokRKJAWi/r0X81/T00FkPs4tjZs5PQGQupMyBSCgaRgdiekT61rjaR6ZYHPvglc6ZvDPLx6/iQJn9+1QY0Wq44Qex0ad0dSUa+4sxCAJSLkqCB3pB9VPGgcMyQAHI5HrJ4ChpnPtZa6AghcB+v5FegPNINUOtFKJ5kO0SZ7TQD5fsCH/y1/PFp2XDL8Ju/NT/rnSfsiAB1ChtTWRiqcDBYZrXvEdasUXZh9rgTUzcMzw3wEGIfCZVY18qvL107sBnPmRfuB16bQkdZMmj0AdqHKeo+5Zz7H/lZgkKkohTJudqxN1kRjWnXOwO5kY0SHCQ5iB17Jf++PSmevQog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvLuXvliLRMeIs1SPB+JYLyNdyWnfhRVqk8q4r5H50w=;
 b=PGSR2PTj+CH5V8cgLiyQd36k3hSuJyeWcRrZL3URZB63tmjMCFuc6SDK0iiNhZGEWeUuT4an/eu5SeeXlbP1TgRIXzhLXUHa8X5wQKhUbmdMAiQEymIH16KxdOOy/tlBGMEDH8aw4RwFrUYrROWlZ6Q1Mc7NtpCVEXBQDi3ZRzLDLQ+OwnbCoF2ejarIogldTQb5KDYfNomFpQ+2uXZj8S7u3lc9kseaRs+83stLr0MThR8jI8N64oasvTFcVhD6BYuAxIMyEVSbVN5pvlMp5hE/XDL38kexG4Ob8gT4fAIC4R20vD+iOWKLdDl5kd/DmujNaEaraTlZuHljMMOj1g==
Received: from BL1PR13CA0196.namprd13.prod.outlook.com (2603:10b6:208:2be::21)
 by PH7PR12MB7140.namprd12.prod.outlook.com (2603:10b6:510:200::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 01:34:51 +0000
Received: from BL2PEPF000352D2.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::6a) by BL1PR13CA0196.outlook.office365.com
 (2603:10b6:208:2be::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 25
 Nov 2026 01:34:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL2PEPF000352D2.mail.protection.outlook.com (10.167.254.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 01:34:51 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 17:34:32 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 17:34:32 -0800
Received: from mtl-vdi-603.wap.labs.mlnx (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 17:34:28 -0800
From: Jianbo Liu <jianbol@nvidia.com>
To: <netdev@vger.kernel.org>, <ipsec@lists.linux.dev>
CC: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Florian Westphal
	<fw@strlen.de>, <linux-kernel@vger.kernel.org>, Jianbo Liu
	<jianbol@nvidia.com>, Carolina Jubran <cjubran@nvidia.com>
Subject: [PATCH ipsec 3/4] xfrm: Wait for an RCU grace period before freeing device state
Date: Wed, 25 Nov 2026 03:34:11 +0200
Message-ID: <20261125013412.1123866-4-jianbol@nvidia.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261125013412.1123866-1-jianbol@nvidia.com>
References: <20261125013412.1123866-1-jianbol@nvidia.com>
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D2:EE_|PH7PR12MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da6a997-1169-447f-0fe3-08df4a944cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|7416014|22082099003|18002099003|56012099006|261026121527099003|11063799006|261028144727099003|261021121427099003|261026140227099003|261022105027099003|261021123027099003|261009223027099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	asMm/wblHMuTDuuqCKGzPcx8d656DSuI4Lv3rWPotmhASOS/CkSgS2AhHcDi0JgSASAA9loC+2KgfQMx5X4x7EK8aW6Bsy1jkhs5sMlsOqlwrR0bzxzXVPullE+IMYQ02IB5D5DmkRVhoVcQptNJBhWAWunuYDDcplh0BDC9GqKxRdOp/Kc53aotkZJLsWDTwQ3TyzyeV/iA9R9wquWytwFSCshRK1Jtm/wJbVzBwIckZK2Pf2lK3NGOMr9tdXkvs+cFCZVA8p40L/1zF2JvCsJlHX8836hEvYHyAd3UEpDvx/wG2JmtG1i43o1Ynj9Yw8MDcsOjchz/sJ5m57OvvbDkA5pEM2eoqpWWBJbdwxeMcL89gm8aAUZKqRBTfA0JL6h5ys59dygMFthAYKG07E1kaofiXYMRVe35bzZGVuQvn/Rg4UiI3TIx3er2Fq+EhCPx8mEl+juDiUFy1HOjr6rjnYr4WspC4m13HFx0PzR6dKmjOWH2YwIpscv2DtmvannXcJa8qz+cc7m93UD6S4UBP+t+m5XfIZJf9f1hebs7QD3rzdL/VnHTQswsn93LKTF0BxDv7HaV5e3uGHOAeHeTfjBcy6WVu6jVq2ZmeK4wBfrPq7NRheB3ANx2kYko6FNABztN5Tfy/iCqcgr722YdwzPrLFn5MeA23vpIBjWMUtRTcMghxWbQ4AijDg1DZimW27MsRQd8z47X3+rLNw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(7416014)(22082099003)(18002099003)(56012099006)(261026121527099003)(11063799006)(261028144727099003)(261021121427099003)(261026140227099003)(261022105027099003)(261021123027099003)(261009223027099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G/xosg3PdbrSlxUx2c16nuaeph1jrujJjbUfdIUDkz/AHQARNyZZoS/fQQe2j2Jtz69S3FifMvh/N1GpzSC9achfCHLbQI4LqAvV/kno0gpzGpUiInrs+cuWU7L+buT0dC4ekvPBo+VeA0O2585PyCLu1fqUDc0L028GOWsS0/+n3JJ4DTvbnFTf8nCfzz10kLsDlKDvrV14xSl8GtvAikkqopsh1TGbuCVhdlCtnO080YtdPXPjmt+y1libk6hNKSh28GvkDYi2wvZtn21otbnXdqM5XtibiBzMUURKurHnnQTNxrhv4fxByaGqEoGGVTYm1g40d+waX9hMyt4AUdYkaTtF9l6NdEprMdPU6FVpKFDGTyfeXMkwQ58Hg/CnfU8j2tTT/+HypS2n4o9cOYrCgIfJ7ZeW7dJqIQDeS/FcTOpYnMOHqeiw+1Zp5zt/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:34:51.4134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da6a997-1169-447f-0fe3-08df4a944cea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7140

xfrm_dev_state_flush() can call xdo_dev_state_free() immediately after
xdo_dev_state_delete(), without waiting for pre-existing RCU readers
of the driver's SA state to complete.

The normal state GC path waits for an RCU grace period before
destroying the state, but the device flush path does not.

Remove the immediate xfrm_dev_state_free() following
xfrm_state_delete(). The delete path queues the state on
xfrm_state_dev_gc_list. The subsequent collection pass picks it up if
a reference is left. If the flush dropped the last one, the state GC
frees it after its own grace period and xfrm_flush_gc() waits for it.

Wait for one RCU grace period after collecting the states and before
freeing them. This establishes the required
xdo_dev_state_delete() -> synchronize_rcu() -> xdo_dev_state_free()
ordering while using a single grace period for the whole flush.

Fixes: 07b87f9eea0c ("xfrm: Fix unregister netdevice hang on hardware offload.")
Signed-off-by: Jianbo Liu <jianbol@nvidia.com>
Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
---
 net/xfrm/xfrm_state.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 8465ae064742..9883fb3545f8 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -1000,7 +1000,6 @@ int xfrm_dev_state_flush(struct net *net, struct net_device *dev, bool task_vali
 				spin_unlock_bh(&net->xfrm.xfrm_state_lock);
 
 				err = xfrm_state_delete(x);
-				xfrm_dev_state_free(x);
 
 				xfrm_audit_state_delete(x, err ? 0 : 1,
 							task_valid);
@@ -1038,6 +1037,9 @@ int xfrm_dev_state_flush(struct net *net, struct net_device *dev, bool task_vali
 	spin_unlock_bh(&xfrm_state_dev_gc_lock);
 	mutex_unlock(&xfrm_state_gc_mutex);
 
+	if (!hlist_empty(&flush_list))
+		synchronize_rcu();
+
 	hlist_for_each_entry_safe(x, tmp, &flush_list, gclist) {
 		hlist_del_init(&x->gclist);
 		xfrm_dev_state_free(x);
-- 
2.39.3

