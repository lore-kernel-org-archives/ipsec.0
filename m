Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570490;
	b=zHaJKDi/YKhDMnuD0n4p+KHjmr4QfRdy6AgjoL/rmJKfg/kZL3StESIJWszGsU2UnDUG
	 cts4VfTgiRB3eqTJy+AeGeNRe4v/bMX9wPVvGhEaNJCxgQ9hgL2c9DZUkMDV2rNqSVUSN
	 QaKx+4alZ1ZXbtAHoaMcinfBL2ULWPj/YkuWTzAi3Z9QcoZAVNeAH0Ij004vETlTXMHr3
	 czoujEmSkIvmaUBjRmD4kk+YWA3XxVNc81w0YvJxiFLHfm9/6jtISHuBvKYsZiTjKdOfM
	 bhJ/V6eLTgEEXSBB7wuldmWaW0GQD89pWwygwIVQd4uNSlhUYLDnJT1yiFkySuFBj1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570490;
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
	bh=NEOPv3zf7L7/pK8kHZwuL90zXDwwKD9vPy9SJIwZzVA=;
	b=AWGDLcSA3rMBkHNK6FRH/lppvgMgChB657a0tSDKOQi1zkQKF4eoo8SjkRgTApvfK6ms
	 TXEqjRuNuZtMZa9LnPpAjTvro+toXowofHXDtqtv7kfkTmIhg/HDPd1NpwJV0KaQ3qIKn
	 QstiTiPKxst8FkLe1xc27LrWHjy3Smte+xzgDy8i3iZ5Uigxz+5gaD4fTNd9qq1z472aL
	 gOp4yPEIWMe75ZtUlq+4WcQHHIR55vLRJpeQUMFeE7BM4eqIS+cNcyP+YP5ySSO1eeyTi
	 3EbgYP40AWc2WlW1pNtMWgUTofxqUen37ILkNf90ykg6PuRUFe2vIdRgwEUDikqqUnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DUu1VEnt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.5
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013005.outbound.protection.outlook.com [40.107.201.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F90B606A323
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 01:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F90B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DUu1VEnt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2O43YwOb4Ajbrh6tTCc0+7ZYmd8kb5vAeAkFn6Ud+hc+g3XHlTqjMbqtwG0NnyIQxSfR+4sizPWZLKAFOyoB+N6G9qxFSob29YRwpzWMWazKKdV6DYOIp/KQMnZlWumzXRaE5iTmNwfJHLxfvVM3BL6vrySMocBhPbgdnPYmDiFzoq+HGG4yjX6EsiH/WxYIvmZtlILFLdCbjyyMcDsCHR6jsxW9xYSHWpmAGtFboHZSU5ei6m0nbUvZ5zCZOJhtRt2v+E680Q8GOn2nXjvisvB0zMjSai0sDoIcMQ0Ig8Kr3KVjZAzuirQerEPc0DQ7kD2pmxawnsRPyPQWvq17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEOPv3zf7L7/pK8kHZwuL90zXDwwKD9vPy9SJIwZzVA=;
 b=ZLYseaIpcCSK/mS1F5tBw1zS6ZkyuFvFsvl8u9UEGsSdp+fuBYjx7PpmomhdHSxoDLSrstNAcNMkQ2hzO3gL3bOjtnrQJyl3gGBSz8bawZAOJzHNGMz73Ci70U1c3UMSwi+HK5wdtiiDGnqUHgZfLmBvTwP2Pkrx6qcdnmwSfui7a/ZymuTycQZZ7RxWeu9A1qt+q7mAmXMuFnAU7YYAP00nGtFa2tSjrzhGNzmMeMz1fQt40WHv+qIBSZQVWXPHFnn/7xVBRqhb7dRP7kbUsj807zzXls11DKDXz6up0WF3d7HAzR3dtNljTY5D+6NEYuEw2pc/aLjr3ErNJRyIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEOPv3zf7L7/pK8kHZwuL90zXDwwKD9vPy9SJIwZzVA=;
 b=DUu1VEntd05guYvG+2QX5ge+1EmI/+h4CfLZwHemtZW464gq7SR4HP/DXDuEcdXcDSB3XSJMiPxRIsdK8duq8YkCK2lXsvFKTkekPZx0/rkVT/PlafsrrRrG/9plRi1xmZ7pA5MvMWGAj+NFavUm+uyLIj1Mzo47aJSZ2Cb+DwLDDM5J5y2YYUwpczBxdk7M6RaGRATIR2Ye40txnnSyzIrEcHjQKKVyYcuieIBYHQhjzGVQmIbiUfhLM1KVbboPdvSIMteV+I1JOnHgRoop/+E/mPnLx8bKmWxv4FEmw9grp7HD/9fEz8UVDQlCUSj/oopkBS/Di973dTOR2g9mxw==
Received: from CH5P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::16)
 by IA0PPFA8EB66EE9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bde) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 01:34:42 +0000
Received: from BL2PEPF000352D4.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::9a) by CH5P220CA0004.outlook.office365.com
 (2603:10b6:610:1ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Wed,
 25 Nov 2026 01:34:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL2PEPF000352D4.mail.protection.outlook.com (10.167.254.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 01:34:41 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 17:34:24 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 17:34:24 -0800
Received: from mtl-vdi-603.wap.labs.mlnx (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 17:34:21 -0800
From: Jianbo Liu <jianbol@nvidia.com>
To: <netdev@vger.kernel.org>, <ipsec@lists.linux.dev>
CC: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Florian Westphal
	<fw@strlen.de>, <linux-kernel@vger.kernel.org>, Jianbo Liu
	<jianbol@nvidia.com>, Carolina Jubran <cjubran@nvidia.com>
Subject: [PATCH ipsec 1/4] xfrm: Give GC list nodes their own storage
Date: Wed, 25 Nov 2026 03:34:09 +0200
Message-ID: <20261125013412.1123866-2-jianbol@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D4:EE_|IA0PPFA8EB66EE9:EE_
X-MS-Office365-Filtering-Correlation-Id: 59683ecf-dd32-4344-8755-08df4a94470a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700016|23010399003|22082099003|18002099003|56012099006|261026140227099003|11063799006|10067099003|261028144727099003|261102123227099003|261026121527099003|261022105027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	MceSClTVA8bIi5HFQK99nqzPGFy7DUtJOaB9lrcKZEQfUHQ4FAl4gapwqtHTNKpJU6NUPuFUcLTUCBWzt+KrbTvwNT2Tq5bUMD4NuCbNlfuXWSRdDXRSdAlMh+TrJmKN2kIwXnegYE8AJHtIZ6jyz4KpZDBHTqigmkpii5N40fGXXzzRzVXk6Pl8c9fPbOaLeVY9c5eNwmMWcahVcbxijukulrELpGm3izqxjw9WYhVDzAHxfjeMD8iNFv3S7sGQQRUnTzoGEi564zRoax0CwWNsk3f67beLCvB4Ek+xz6A596R/AFkZxE3I0cxF1n+sgnJaX3kFFLlYIraW2IAsVNRQADGw8Vw7iohXfUCzOpdxxM57VpNib/6tzbFy2LkkhnnuiE2b46IJpzcpUMOVYbJCBWgfUmiXJwQPbNMbzMeByKPnQxqDueMmizDV4KnCPWA+LulEI2W0zv2m4qLGFK8UGobHTTt6S/UHj+6AVdZWOytXhUJozfbBqh03dZCz3dby0bGvIrd3gPq6alhqpSLWZHfmDzI4gRubJmSVbBr0/IPnM0C18ZVz5O4o1glJwtFqqp/27oNM6tBJm6wNc6pWkdk8pCpZdBEq7YwPBLAv2f2ZBJ0NlZsxdaU8X97Kt6fYJv4q3OJ4r6M7hNMTODWtTvkc241e/1MlQTPNvuV8qmP5+iKiuHeZECvJNGYLDg7SMXOPy3GP+UlCbD7aaw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(56012099006)(261026140227099003)(11063799006)(10067099003)(261028144727099003)(261102123227099003)(261026121527099003)(261022105027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7hRAvr/ZsfHNkOyBxZT6hn4h4h72IiF7MNvp4GfzXdBLjLfMsCoaHILlTdfSOqC7MIKZIM1LGVDdQfe0p+7QgVyJd3BQ2F+FHorgCsDgcY8XE9esycQu0g/o3meGv5OXbpCZUw7pm1A3tCSIC9gX/ivGg/Kn3IlIBJWIYsNJ6vbdy9uWnCHrAkPYDCl+w/3J0gQ8lKSz/JVKVDCUvHwWNF7GZz6P+TWpqyPgKbVTmx1gv6td608r9t7qI/W7go91/J0Wn8ghZTKM6tK+Lu9W1QnPYSH7sn0u4r8mdMprZBNduRHmCbY1vskpN8bkxo0ClScJgR+nCNGAyD5kYcPg2AisbHh5cJB5gds6gujEChFCRu0OXyyGI8augUMjryW+CugTJ+3f/2PA8q9RiZIuEyxhJx9L8iJ8/QuV/ue3soeVB7fjpsaz3BzOlzYAfUjl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:34:41.5558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59683ecf-dd32-4344-8755-08df4a94470a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352D4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFA8EB66EE9

gclist currently shares storage with bydst, and dev_gclist
shares storage with bysrc.

This is unsafe for bydst and bysrc, which can be traversed under
RCU without holding xfrm_state_lock. __xfrm_state_delete() unlinks
these nodes with hlist_del_init_rcu(), so a reader that started before
the unlink may still be following their linkage after the state has
been removed from the hash table.

Later, when the last reference is dropped, __xfrm_state_destroy()
adds x->gclist to xfrm_state_gc_list. Since gclist and bydst
currently share the same storage, adding the state to the GC list can
overwrite the bydst linkage while an RCU reader is still using it.
The same issue applies to dev_gclist and bysrc.

Give gclist, bydst, and bysrc separate storage so their hash-list
linkage remains valid for outstanding RCU readers. Share dev_gclist
with byseq instead. byseq has no RCU readers, only
__xfrm_find_acq_byseq() under xfrm_state_lock, and the state is
unlinked from byseq before dev_gclist is used. Sharing keeps the
growth of struct xfrm_state at 16 bytes rather than 32.

Fixes: d737a5805581 ("xfrm: state: don't use lock anymore unless acquire operation is needed")
Signed-off-by: Jianbo Liu <jianbol@nvidia.com>
Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
---
 include/net/xfrm.h    | 10 ++++------
 net/xfrm/xfrm_state.c |  1 +
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/net/xfrm.h b/include/net/xfrm.h
index 445223a8dc6f..bc59a979a4d3 100644
--- a/include/net/xfrm.h
+++ b/include/net/xfrm.h
@@ -189,16 +189,14 @@ enum xfrm_replay_mode {
 /* Full description of state of transformer. */
 struct xfrm_state {
 	possible_net_t		xs_net;
-	union {
-		struct hlist_node	gclist;
-		struct hlist_node	bydst;
-	};
+	struct hlist_node	bydst;
+	struct hlist_node	bysrc;
+	struct hlist_node	gclist;
 	union {
 		struct hlist_node	dev_gclist;
-		struct hlist_node	bysrc;
+		struct hlist_node	byseq;
 	};
 	struct hlist_node	byspi;
-	struct hlist_node	byseq;
 	struct hlist_node	state_cache;
 	struct hlist_node	state_cache_input;
 
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index f4a4ddaeb9b3..3eb012ed8657 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -751,6 +751,7 @@ struct xfrm_state *xfrm_state_alloc(struct net *net)
 		INIT_HLIST_NODE(&x->state_cache);
 		INIT_HLIST_NODE(&x->bydst);
 		INIT_HLIST_NODE(&x->bysrc);
+		INIT_HLIST_NODE(&x->gclist);
 		INIT_HLIST_NODE(&x->byspi);
 		INIT_HLIST_NODE(&x->byseq);
 		hrtimer_setup(&x->mtimer, xfrm_timer_handler, CLOCK_BOOTTIME,
-- 
2.39.3

