Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570497;
	b=q/+YxlP30+WkaEgUwoLtMUMGD4dBYMd2bgnfVB4X4DQJ2XWp5J15ItldOzvYmWbjq9he
	 TrVH7yzouLuryJ9xkBDyuEfR047Z06cOgVrtoRLJXk1aH6ZweZpYTz9JiPgWJQc0vLSWm
	 pXYYObQ1KQ+yoEJLRWbX7m4qBLOifFvH5n9xNh94e5SLrhu0oO4OL3mUd4+QJAI00Eu6D
	 NPXqa9V9TcvZ6Zv7Kfm4D3WAZZsk/gRfLJQ5+k9ndHlcZZIBqJNDcoZAmEGnCfRRboUEL
	 3tkfoJp/0ji/biHaYWEDyiN7LIrFjKGrWEgLvFZnW3XbqpiLDnBglxr2mvC8P/XS4Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570497;
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
	bh=/X99SVcWokGbYbSQ79POR+9UUhCOfQ1oULvVM2QRI1s=;
	b=FPJT/aczE8CK3LwYmrRmXZJ2bS4EwLQVnzqp15WtCoiy7wPMV1fE+R105pwm720k2JD2
	 t2oy/mfl4IQVnfGiQtlhZNzw6kAAdvrbEzAb1NlAxrNWXMprsg/5arzxcZLVfeq1zogTl
	 yMgFfyCWPru1CNqRzmHWBYUFo18EIkdzFhIhPCkiklQKGECFyi+pC1i1ZHubfOPIfhpAS
	 c6DhLbmoczCw0Ks6D4l25Tp48yd9x+g9jNZ4BVyylEDhRQ99qe7Za/0sJbmh0j0gemOjR
	 DI+ZWasULveRBBmzzDz4ItHfrcDl7Y4uC+AkbVXPj7TkKC7ekXAQUfCFED5Dt/kd31Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=b75xDQ+N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.4
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7689606A331
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 01:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7689606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=b75xDQ+N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IifXn2lGLqAWZBOANNTHSwBGXP+jqKrke0ZBYMB64yKRZ9SxScUNodHgpBhWi23lKMhfFNKIQbC/56e5wD50MiKEOSCGLoXfWTzmPH7M6++C1g17SqiM4B4SNVRF+wTtWpISFu0cZS6dqVyRKEBMa0SIClbMHp6EnK37pzRZQYjIUXRD8KUg57++QUuxaMF+ba4s167UTdcJsKNvT6bbP5HG0+xJcx9GrKaWoTAQ3Mey5+9NETLKAzYiuQGssPkDXbKLnFqbgQLcL0/XiYsxYs//SAPmmSye+0s1NrM+PelLuDToJToATEpEaKo+K4PeC1flD81sUTUUQzzgcThrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/X99SVcWokGbYbSQ79POR+9UUhCOfQ1oULvVM2QRI1s=;
 b=CIWkYo9mLXIdS61Wyj5avcCtIFLzp7quRvfwhAy66vF59/OVcPbIbp2/TRQxt7SDBsLdAngLlLOv+77RAEZq5Xh//I114eFQ99HjCRLOwZ3LkFraBBE7DYqbY0tV7wx0mAw35xAvCORs6/8/l/I+TodQy6WdF7kW0tRPCIiJN93FnASoOqosTAAKdZgnnkXzEsUWKCd7blu3QAwOilEi+rnhoQ7HgiRAZWw4qaJZ+zweTh6gfPKBBXC3Qtd+UxWcvjTICEOljFDD9yMbP+NkxooF6VmLFZCexKmBvvQWF38FqsngoxYT3SPst3A8yb1902p+jpkI7AJTkP8fDB+FyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/X99SVcWokGbYbSQ79POR+9UUhCOfQ1oULvVM2QRI1s=;
 b=b75xDQ+NDJ3soMwo7f1sDRWgrgQIYH3XuvIldWONNGtc/iVqSz5dxjwgoT4uxyCecqH3NOaz+Lom+wrS1HHtCgMETX/H2Q3Jf2du3blW7zSAgpz404qfDG+xmAAIdWtwfSAqfBZwXxbcaC/BGuw9SaD1FKHeAxVyBnku6n1I/3ntWWYU9rdL3o3UInHow/BvCUXDlqAXX6kbE8AFarr0VO/B3D9F/0/C1CoWaAXdbT/zSXlANG7rx0fedYTF1mZJkI2+1h8+cBWVaHGiRDMqNREEUBblPu8qC8wsyREpJX/4eDQ4wna6F/3DCtQ7Gm9L4AxCEWv4D8BP2xsj2lzbDw==
Received: from CH2PR08CA0021.namprd08.prod.outlook.com (2603:10b6:610:5a::31)
 by BL3PR12MB6402.namprd12.prod.outlook.com (2603:10b6:208:3b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 01:34:46 +0000
Received: from BL2PEPF000352D9.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::b) by CH2PR08CA0021.outlook.office365.com
 (2603:10b6:610:5a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 25
 Nov 2026 01:34:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL2PEPF000352D9.mail.protection.outlook.com (10.167.254.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 01:34:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 17:34:28 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 17:34:28 -0800
Received: from mtl-vdi-603.wap.labs.mlnx (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 17:34:24 -0800
From: Jianbo Liu <jianbol@nvidia.com>
To: <netdev@vger.kernel.org>, <ipsec@lists.linux.dev>
CC: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Florian Westphal
	<fw@strlen.de>, <linux-kernel@vger.kernel.org>, Jianbo Liu
	<jianbol@nvidia.com>, Carolina Jubran <cjubran@nvidia.com>
Subject: [PATCH ipsec 2/4] xfrm: Serialize device state teardown
Date: Wed, 25 Nov 2026 03:34:10 +0200
Message-ID: <20261125013412.1123866-3-jianbol@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D9:EE_|BL3PR12MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 516999bf-edf1-4332-4a22-08df4a9449c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|7416014|376014|10067099003|56012099006|5023799004|11063799006|261028144727099003|261026121527099003|261026140227099003|261102130727099003|261102123227099003|261021123027099003|261021121427099003|261021135927099003|261022105027099003|261022075727099003|261009223027099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	VO6y+boUEms9YsX8Ohrp+wVwPgbTBB8TJTFuFDaqIQNe0Jjhk1/8DE2+q07m+Y7m1VV8R6IX80mYAchoK1rl4//lduYvAUn6caGHCARq46MHrQhdQCNzRG7PVwUG1E7d4uvC7TOaiAiGXTyloUrqSFqdBqoPx3bLyeAQJEWy2lofKXKLgbU0WYYdIvjV57C8UJMf/DO4AIjHhGSObUIhcxEOKdDAoVNnkEtK9Vt0nrW4iLMx7ecpnf/RcWB1z2MBvQ1tcY/cqRXZyO8f31r2P9M+3vDYKxEjCdZjrB+A1JWInhpW+Ven1InPdjYXrO9CkwJvZmtlvwZeDHVxEdZICv8ypNY62LaF3Hw5eRPTkbwabNukz6ubB1nG4DWqkgAs7mCUKOcRSOSY9On8ca6TKG/pwV4xJ1waj6PboHD3+gOmbMwcZzYMn5N2dKWMaMusGsH12SCAtwlH8zvApSksPbVUWO+i23HWxBkk/ZQQFYq/op+J8IgIEzSlR+FdHWZ84zGjKNtEK4bIU8f1YfGmr0lAJWMfmUPM8D/zzmq5kemIidylfUKBxTSo9Yf0FuCiSkWeMmUdHVzCqg7+0s0sIe/w5ilzB/3Vdp11aTzByWgiK+zUX4D5VqKxzF+ZLBQ6ZtA+PKaU297fmGz64cqoz6vK958L6EAKNT/KjbaA6d0c8P9wHNiwHlQmUxcLjQn6isORAgeCoATgmSDBrZSJrQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(7416014)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003)(261102130727099003)(261102123227099003)(261021123027099003)(261021121427099003)(261021135927099003)(261022105027099003)(261022075727099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	32Hx3bRfYCvWF6ckhTAQD6Kt/wb9HKBW+6YrRtkCy/u8Hz44nl8slabGU91aRMfjcUj7KODWdKF5iyTcHvUhPqmY/RP7HYVQR6gSwKRpeJi3aysBVBXhrRlintfuoWTX0uuQr272vpH1Dm+LJplQzcYNr9NnPQ4OACR55zxyNgnJ2Dnljbz9z6C2tqc+y6NsjyZh0JSu19Y/Y6ZVRa+XU+Rp5i56tUAdMSeLK1XuZMCH7i5ILx0bUxeFI1D7vNsMvFEZbJvIMDCaPbcqDxcXWdJUPxrUJ4wU6ioeLX/l6FTsJs0+pS5/YQeXxETr3vDrx43Tf6ZBXNlRlKD+NHC+Na+0uKefGhfvBE0rPZiaEGsIAoSGU/izPM9d/2pBNtjr1oWyi6Rf70SQ5QmC2Mvf9xzSh1AK70XNbll59OznXmlqPQkPnOII5S/0jQQcSQU+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:34:46.1285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 516999bf-edf1-4332-4a22-08df4a9449c3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352D9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6402

Commit 89fefad9f971 ("xfrm: serialize state GC with device state
flush") stopped the state GC and xfrm_dev_state_flush() from freeing
the same device state at once, but a third caller is not covered.

xfrm_state_find() frees a packet offload acquire state when km_query()
fails. It runs under RCU and can't take the mutex.
xfrm_dev_state_delete() first puts the state on xfrm_state_dev_gc_list
with xso->dev still set, so a device flush can find it there and call
xfrm_dev_state_free() too. Both callers see xso->dev set and both
unlink the state, so the second hlist_del() hits a poisoned node.

Claim the device in xfrm_dev_state_free() by clearing xso->dev under
x->lock and xfrm_state_dev_gc_lock, so only one caller unlinks the
state, invokes xdo_dev_state_free() and drops the netdevice reference.
x->lock also keeps xso->dev stable for the stats updates that hold it.

In the flush, take a state reference before removing a state from the
device GC list, so it stays alive while the flush owns it. Skip a
state with no reference left, the state GC frees it.

Keep xso->type unchanged after detaching the device, so lockless
readers of xso->type do not see a packet offload state as a software
state. Reject offloaded states with no device in
xfrm_dev_offload_ok(): a packet offload state would otherwise pass
the !dev check there, and xfrm_output() would send the packet with no
ESP or use the NULL device in xfrm_dev_direct_output().

Found by the AI review of the commit above (see Link) and reproduced
on ConnectX-7 with a packet offload policy that has no SA, an acquire
listener that never reads, UDP senders hitting the policy and the
device taken down in a loop:

[  167.689163] Oops: general protection fault, probably for non-canonical address 0xdead000000000122: 0000 [#1] SMP
[  167.690938] CPU: 11 UID: 0 PID: 2093 Comm: python3 Not tainted 7.4.0-rc1+ #10 PREEMPTLAZY
[  167.694337] RIP: 0010:xfrm_dev_state_free+0x41/0xe0
[  167.699068] RAX: dead000000000122 RBX: ff1100014f543800 RCX: ff11000103bbf800
[  167.700247] RDX: dead000000000100 RSI: 0000000000000001 RDI: ffffffff82da8c68
[  167.716897] Call Trace:
[  167.717405]  <TASK>
[  167.717863]  xfrm_state_find+0x19b0/0x1ab0
[  167.718629]  xfrm_resolve_and_create_bundle+0x17d/0x11e0
[  167.722070]  xfrm_lookup_with_ifid+0x1e7/0xb50
[  167.722872]  xfrm_lookup_route+0x1d/0xa0
[  167.723593]  udp_sendmsg+0x8da/0xc90
[  167.724273]  __sock_sendmsg+0x38/0x70
[  167.724988]  __sys_sendto+0x119/0x180
[  167.727954]  __x64_sys_sendto+0x20/0x30
[  167.728666]  do_syscall_64+0x72/0x3b0
[  167.729357]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[  167.741064]  </TASK>
[  167.752388] Kernel panic - not syncing: Fatal exception in interrupt

With this series the same test ran 400 cycles with no crash, and 150
cycles on a kernel with KASAN and lockdep.

Fixes: 07b87f9eea0c ("xfrm: Fix unregister netdevice hang on hardware offload.")
Link: https://lore.kernel.org/netdev/20260908224854.1591115-1-kuba@kernel.org/
Signed-off-by: Jianbo Liu <jianbol@nvidia.com>
Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
---
 net/xfrm/xfrm_device.c |  4 ++--
 net/xfrm/xfrm_state.c  | 51 ++++++++++++++++++++++++++++--------------
 2 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/net/xfrm/xfrm_device.c b/net/xfrm/xfrm_device.c
index f153bf695b9d..3bbb970cd337 100644
--- a/net/xfrm/xfrm_device.c
+++ b/net/xfrm/xfrm_device.c
@@ -422,11 +422,11 @@ bool xfrm_dev_offload_ok(struct sk_buff *skb, struct xfrm_state *x)
 	int mtu;
 	struct dst_entry *dst = skb_dst(skb);
 	struct xfrm_dst *xdst = (struct xfrm_dst *)dst;
-	struct net_device *dev = x->xso.dev;
+	struct net_device *dev = READ_ONCE(x->xso.dev);
 	bool check_tunnel_size;
 
 	if (!x->type_offload ||
-	    (x->xso.type == XFRM_DEV_OFFLOAD_UNSPECIFIED && x->encap))
+	    (x->xso.type == XFRM_DEV_OFFLOAD_UNSPECIFIED ? !!x->encap : !dev))
 		return false;
 
 	if ((!dev || dev == xfrm_dst_path(dst)->dev) &&
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 3eb012ed8657..8465ae064742 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -790,20 +790,28 @@ EXPORT_SYMBOL_GPL(xfrm_dev_state_delete);
 void xfrm_dev_state_free(struct xfrm_state *x)
 {
 	struct xfrm_dev_offload *xso = &x->xso;
-	struct net_device *dev = READ_ONCE(xso->dev);
+	struct net_device *dev;
 
-	if (dev && dev->xfrmdev_ops) {
-		spin_lock_bh(&xfrm_state_dev_gc_lock);
-		if (!hlist_unhashed(&x->dev_gclist))
-			hlist_del(&x->dev_gclist);
-		spin_unlock_bh(&xfrm_state_dev_gc_lock);
+	if (!READ_ONCE(xso->dev))
+		return;
 
-		if (dev->xfrmdev_ops->xdo_dev_state_free)
-			dev->xfrmdev_ops->xdo_dev_state_free(dev, x);
-		WRITE_ONCE(xso->dev, NULL);
-		xso->type = XFRM_DEV_OFFLOAD_UNSPECIFIED;
-		netdev_put(dev, &xso->dev_tracker);
+	spin_lock_bh(&x->lock);
+	spin_lock(&xfrm_state_dev_gc_lock);
+	dev = xso->dev;
+	if (!dev || !dev->xfrmdev_ops) {
+		spin_unlock(&xfrm_state_dev_gc_lock);
+		spin_unlock_bh(&x->lock);
+		return;
 	}
+	if (!hlist_unhashed(&x->dev_gclist))
+		hlist_del(&x->dev_gclist);
+	WRITE_ONCE(xso->dev, NULL);
+	spin_unlock(&xfrm_state_dev_gc_lock);
+	spin_unlock_bh(&x->lock);
+
+	if (dev->xfrmdev_ops->xdo_dev_state_free)
+		dev->xfrmdev_ops->xdo_dev_state_free(dev, x);
+	netdev_put(dev, &xso->dev_tracker);
 }
 #endif
 
@@ -974,6 +982,7 @@ int xfrm_dev_state_flush(struct net *net, struct net_device *dev, bool task_vali
 	struct hlist_node *tmp;
 	struct xfrm_dev_offload *xso;
 	int i, err = 0, cnt = 0;
+	HLIST_HEAD(flush_list);
 
 	spin_lock_bh(&net->xfrm.xfrm_state_lock);
 	err = xfrm_dev_state_flush_secctx_check(net, dev, task_valid);
@@ -1012,21 +1021,29 @@ int xfrm_dev_state_flush(struct net *net, struct net_device *dev, bool task_vali
 
 	mutex_lock(&xfrm_state_gc_mutex);
 	spin_lock_bh(&xfrm_state_dev_gc_lock);
-restart_gc:
 	hlist_for_each_entry_safe(x, tmp, &xfrm_state_dev_gc_list, dev_gclist) {
 		xso = &x->xso;
 
 		if (xso->dev == dev) {
-			spin_unlock_bh(&xfrm_state_dev_gc_lock);
-			xfrm_dev_state_free(x);
-			spin_lock_bh(&xfrm_state_dev_gc_lock);
-			goto restart_gc;
+			if (!refcount_inc_not_zero(&x->refcnt))
+				continue;
+			hlist_del_init(&x->dev_gclist);
+			/* xfrm_dev_state_free() may consume dev_gclist. The
+			 * reference prevents state GC from using gclist until
+			 * this flush removes it and drops the reference.
+			 */
+			hlist_add_head(&x->gclist, &flush_list);
 		}
-
 	}
 	spin_unlock_bh(&xfrm_state_dev_gc_lock);
 	mutex_unlock(&xfrm_state_gc_mutex);
 
+	hlist_for_each_entry_safe(x, tmp, &flush_list, gclist) {
+		hlist_del_init(&x->gclist);
+		xfrm_dev_state_free(x);
+		xfrm_state_put(x);
+	}
+
 	xfrm_flush_gc();
 
 	return err;
-- 
2.39.3

