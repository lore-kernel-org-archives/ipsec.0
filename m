Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795572545;
	b=lfc57cugFGUP7vFxCq+jD2TK9Sz+Bo4+6zt+5lTXuZGqMwfFPFdTIO7at1i1DTWCRpm4
	 L24xkiAo7Wm3o+3nBtLpxppf0S5KxdrdMsM+mNYdoQwSUMVOU5zFdsyxEoBaRyN8R9OEb
	 iO3k3bh42bT6Uvzd1dwc1umHbCOy475f6/wP4D7Wbot9r3a3g2/q1Pjc353iYpwDYmJwg
	 MdOO9MEYU//gOerZmdfzSFnXdUcHbl4Zqdh41FrgOxdZQHIx81GtieNtyhLnxHEakgLb2
	 NgPAEFS6W2agkkEqZfpca9VNXcv+SSXujHDjj+fWaNibyZU8HaSbqKFGfCzjUsqSSmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572545;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NV-OnPremToCloud:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ILJ73oP/q5gJIQ0+W3AJXe5gmPk7RtpCRadIP3q+2rs=;
	b=Wnnymfpp1CRW11SJPzi4uruNeX9aR17FsPxWZcPTqjH86hv2Z8SCc8x3HXtr7hVfaMQB
	 nA8YQV/DAHEsscZuvDbXbMonls48ynVIA5RAaYBOYmPo3ypQTauHBwW54g94ENPO0qtkX
	 C2B2htxXdXzNkU0iJGGk84jNrgwu6rqLPITnGaQ5JYIKnDcqbbTWAByjfom8rXTGbt60L
	 GvqGcJeSeg/U/TYX5M2Txpa/D0S8zSz5A2Tiz5CRX8ufEfY/+SjbNkl2RQ+5oF8Js1PCT
	 vnvK+ALdE/Ali7/loofz2XESiDegQRGDu5g1fMcG255h3L9xAB8tXEDOWz2KanqvBzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g0wZppBp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.70
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010070.outbound.protection.outlook.com [40.93.198.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87486606A323
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 02:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87486606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g0wZppBp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvEsQaXmJyeE+QQFiGby9Sq3anf7xahcLbq9X8Ozmv3zrUMggJtaMEhp2WQfvvVDZpGplDEI7zFYWQpx8OqL6RAunYdY814ACD73Pfo/dRl0f3NFi1OSiRlwhzbdsXX1RzfOdVmUoJLOfwQN7/ZKJ24FqfOdkryoKsX5hO5UZKTDJgzKfxoWP6HorzMsr5y+C3ZL2ew3qM4Q3jeJusPVJTEFiDFu3Wlbl+2kzS68pSBYhBq9yo3JVbfh78pFqboR3R7hTArkhcs248kRt4VOpSeW2MubX2A5AbuwMC2PIZrDUzdxyHBrJHM4CSKDXbt7SV2taPIgSH2JAzc9FzHtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILJ73oP/q5gJIQ0+W3AJXe5gmPk7RtpCRadIP3q+2rs=;
 b=R+GaEvXiP7f9mRU9zHcLEquiW0g58AVR5UcSYBo21i8PTh5e1uWCpZI2c6WA/PSMWEh95J/WDefnIAMhAis0pyHe77Ugfdb6D7qKxIsBX0Z4yCClVTajQfBdGyNUmmfsgd4dVS9pJeuKY6gjDywYuGFvNmZ/U3ReUwgoqVxoqHrv+6sQv/SuoKVpJXCo/6LYTtFdKpOEoe1CBVBCcAPkNzPbCdVY8B4HEyIYjU8qGCrrqT1jyYGOHL05zQwBDG46JSDkrtDjdI48WZzEXf4jI1w15SxDGJ3DKiHz0yrGI6W10tcmLePg7uFiWYXiizQ1/gZVAXyZ8YLS4kTk1ijkWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILJ73oP/q5gJIQ0+W3AJXe5gmPk7RtpCRadIP3q+2rs=;
 b=g0wZppBpq6fKFztkPQOl8WfLJwIW8v2srU9KtWkxTmteEjM6O2crdKjF/1/5iTMYeRySLEhCtV9b4tdhsR67lKaczZGpbnuEiaKV8/qLx/FuDye/QNadrKVbrhI39Q3+wgjZmrpzodGvz54xizvdCLoWzQhqWhVMy8L7nGNftwA1LI7yVPX74lu9iQjdP105+/LoGAn+VHSErUCB6gnivr7j8nPtkq4GQ5HBZu7LKjCLspurFVAM2qpLMFUe53+oD0PjeY0HIjtF7wQaF9i57lGJ96z2hKMkWDms2yG7IFHDAZs+xKpYFFxOGPKLoSRyAIP2ugNnXzQKKGPFevqXzw==
Received: from BN9PR03CA0898.namprd03.prod.outlook.com (2603:10b6:408:13c::33)
 by SN7PR12MB6911.namprd12.prod.outlook.com (2603:10b6:806:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 02:08:59 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:13c:cafe::54) by BN9PR03CA0898.outlook.office365.com
 (2603:10b6:408:13c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Wed, 25
 Nov 2026 02:08:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.0 via Frontend Transport; Wed, 25 Nov 2026 02:08:58 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 18:08:43 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 18:08:43 -0800
Received: from mtl-vdi-603.wap.labs.mlnx (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 18:08:39 -0800
From: Jianbo Liu <jianbol@nvidia.com>
To: <netdev@vger.kernel.org>, <ipsec@lists.linux.dev>
CC: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Leon Romanovsky
	<leon@kernel.org>, Raed Salem <raeds@nvidia.com>, Saeed Mahameed
	<saeedm@nvidia.com>, Cen Zhang <zzzccc427@gmail.com>,
	<linux-kernel@vger.kernel.org>, Jianbo Liu <jianbol@nvidia.com>, "Carolina
 Jubran" <cjubran@nvidia.com>
Subject: [PATCH ipsec] xfrm: Serialize offload stats updates with x->lock
Date: Wed, 25 Nov 2026 04:08:35 +0200
Message-ID: <20261125020835.1132797-1-jianbol@nvidia.com>
X-Mailer: git-send-email 2.39.3
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|SN7PR12MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 79272f6f-ce41-48df-8150-08df4a99113d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|7416014|376014|261022115727099003|261022113327099003|261026135527099003|261026121527099003|261022075727099003|261021123027099003|261021135927099003|10067099003|261022105027099003|261021121427099003|261021130227099003|261026130827099003|261102123227099003|261021133027099003|261102130727099003|261026140227099003|261028144727099003|261009223027099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	VjborZEuFLgVdj3fMD8IxdyFaIukL84A2wyW3d5Y6Vs2UnGlWg5mwNZtVpaAz0CfFjUIDrWagV6uOAS9wQr66l1q9+qXGG+C7pmnNl+xo8hV2KL5crsR47pOV9aqDdmfqa/uz651vwPQkFni90f+VgE2r+DnSy9FgPQn26KRexwK/BpG50+mNE048/QlalojtmMjp7m2IqK4sRQNqlw/or5l3OMypcIhUFx/CmhTp4rs5eVdPlaWeAidITDeOab+A14U0Nc3unM2j838f9/+/lmISyI8+ML5/uyd6EpUccfMjoYAzeyjYS7x44bi7Gj3LaivN7ILvOiU5udQozuIuInIql1+A+XdlPhILxD6OnVZ733py9AuPtmm2PXfCgmLSTKh3a6gO6mQ46HqcweQLUMdxnx3Um7jHUhLurGgY9dNXy3n7UWziutt4eOdwHXNnCekeFl+OkrZ9AjsO0Mg2N29Ednw8E8OfRlTRgyg8ymfgedpi9YE4FqCChVRAD3P5jgwN43XcyyX9ExcCklw63yyhixVGOnV0LNN5bgUvuWFui/4JWazUbz/stdyD3W7htZpWE46qXhJHX9tkSnu9TOhk7kKO0ObOZeDTDa0CebOoGQFms/gN13352qrbre0tldAHE4swySSgMTDxSnC6qhuTZVem0j9yb1ZEBhrGK3S1OUZ1uea4mUY5dX95e3HBLY0XVgxORuDt1QFOH+fEg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(7416014)(376014)(261022115727099003)(261022113327099003)(261026135527099003)(261026121527099003)(261022075727099003)(261021123027099003)(261021135927099003)(10067099003)(261022105027099003)(261021121427099003)(261021130227099003)(261026130827099003)(261102123227099003)(261021133027099003)(261102130727099003)(261026140227099003)(261028144727099003)(261009223027099003)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p/mIk9oBdkw2xjaGA1dUGIysDVSQ991QU72zz5AtDtPHmZPoq0T4oDMkNnT5ZD60ladniH8RzI4Ahbdz866LjqgHeTd9UEdY7VdnVul89ETJlTIICjx0akSMkk7NTgaLdhPu+XwubRnZfCO91xasmMsg65lFsoBlAZrAWim/K2CkbjMCKUFYmmHu/qRvpytMAh8n1Hw+ljho+ZfQNF59lGwMbTG2WkH7NxlahLpfaK3f6krwKJAwGAjmcwcT6b/A82fAihRf9L+JndZq5hf6YyV8Wwb2a6/U9LNEhBgnwH+cdrrJXBz9CFAiiKTf7G/GsdON7FEi/UIsVW6y7WspyK1O9w9h5qCndxzc8/rA0gope2Vcyh//vouncGdrs3Cc8qVlY0Kv+j8W6cCr2yMbOox0449M9lLDb8KN9xCOFS2hhQmTM4eJP6VQHF4DPV+h
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 02:08:58.7558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79272f6f-ce41-48df-8150-08df4a99113d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6911

xfrm_dev_state_update_stats() calls into the driver, which adds to
x->curlft and x->stats what the device counted since the last call.
Callers use different locks, so two of them can refresh the same
state at once and count the same packets twice, and a dump can copy
the counters while another caller updates them.

Serialize all device stats refreshes with x->lock and assert it in
xfrm_dev_state_update_stats(). Build the SA message of a netlink
dump, get or notification under the same lock.

The SA dump and xfrm_state_update_stats() walk the states under
xfrm_state_lock, where x->lock cannot be taken: the lock order is
x->lock, then xfrm_state_lock. Add xfrm_state_walk_batch(), which
takes references on at most 32 states per xfrm_state_lock hold, and
handle each state under x->lock after the list lock is dropped.
States rejected by the dump filter count against the 32, so a filter
that matches few states cannot keep the list lock held over the whole
list. xfrm_state_walk() cannot give this bound: it calls back only
for states that pass the filter. Walk markers and states being
deleted do not count, so a call always covers 32 states or reaches
the end of the list.

Keep the refresh right before each state is copied, so every part of
a multi-part dump still has current counters. When a state does not
fit into the skb, put the walk marker back in front of it and drop
the references, so no state stays referenced between two dump calls.
If the state was unlinked meanwhile, skip it and go on.

copy_to_user_state() cannot take x->lock itself: build_expire() calls
it with the lock held. Move the refresh out of it and let each caller
refresh under x->lock. PF_KEY never refreshed and does not change.

Fixes: c9fa320b00cf ("xfrm: copy_to_user_state fetch offloaded SA packets/bytes statistics")
Fixes: f9f221c98fd8 ("xfrm: get global statistics from the offloaded device")
Signed-off-by: Jianbo Liu <jianbol@nvidia.com>
Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
---
Cen Zhang's "[PATCH ipsec v2 1/2] xfrm: protect offload statistics
updates from device teardown" [1] adds x->lock around the same two
calls in xfrm_state_netlink() and xfrm_notify_sa(), so only one of
the two patches can be applied. This patch takes the lock in the SA
dump and in xfrm_state_update_stats() as well.

[1] https://lore.kernel.org/netdev/pm-xfrm-core-objects-candidate-0050-v4-3c6b8c5369a802e9be0e-1@gmail.com/

 include/net/xfrm.h    | 12 ++++++
 net/xfrm/xfrm_state.c | 87 +++++++++++++++++++++++++++++++++++++++----
 net/xfrm/xfrm_user.c  | 45 ++++++++++++++++++++--
 3 files changed, 133 insertions(+), 11 deletions(-)

diff --git a/include/net/xfrm.h b/include/net/xfrm.h
index 445223a8dc6f..22e82be62556 100644
--- a/include/net/xfrm.h
+++ b/include/net/xfrm.h
@@ -130,6 +130,13 @@ struct xfrm_state_walk {
 	struct xfrm_address_filter *filter;
 };
 
+#define XFRM_STATE_WALK_BATCH_SIZE	32
+
+struct xfrm_state_walk_batch {
+	struct xfrm_state	*states[XFRM_STATE_WALK_BATCH_SIZE];
+	unsigned int		count;
+};
+
 enum {
 	XFRM_DEV_OFFLOAD_IN = 1,
 	XFRM_DEV_OFFLOAD_OUT,
@@ -1718,6 +1725,9 @@ void xfrm_state_walk_init(struct xfrm_state_walk *walk, u8 proto,
 			  struct xfrm_address_filter *filter);
 int xfrm_state_walk(struct net *net, struct xfrm_state_walk *walk,
 		    int (*func)(struct xfrm_state *, int, void*), void *);
+bool xfrm_state_walk_batch(struct net *net, struct xfrm_state_walk *walk,
+			   struct xfrm_state_walk_batch *batch);
+bool xfrm_state_walk_rewind(struct xfrm_state_walk *walk, struct xfrm_state *x);
 void xfrm_state_walk_done(struct xfrm_state_walk *walk, struct net *net);
 struct xfrm_state *xfrm_state_alloc(struct net *net);
 void xfrm_state_free(struct xfrm_state *x);
@@ -1742,6 +1752,8 @@ static inline void xfrm_dev_state_update_stats(struct xfrm_state *x)
 	struct xfrm_dev_offload *xdo = &x->xso;
 	struct net_device *dev = READ_ONCE(xdo->dev);
 
+	lockdep_assert_held(&x->lock);
+
 	if (dev && dev->xfrmdev_ops &&
 	    dev->xfrmdev_ops->xdo_dev_state_update_stats)
 		dev->xfrmdev_ops->xdo_dev_state_update_stats(x);
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index f4a4ddaeb9b3..041d8aa86256 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -2390,15 +2390,28 @@ EXPORT_SYMBOL(xfrm_state_check_expire);
 
 void xfrm_state_update_stats(struct net *net)
 {
+	struct xfrm_state_walk_batch batch;
+	struct xfrm_state_walk walk;
 	struct xfrm_state *x;
-	int i;
+	unsigned int i;
+	bool done;
 
-	spin_lock_bh(&net->xfrm.xfrm_state_lock);
-	for (i = 0; i <= net->xfrm.state_hmask; i++) {
-		hlist_for_each_entry(x, xfrm_state_deref_prot(net->xfrm.state_bydst, net) + i, bydst)
-			xfrm_dev_state_update_stats(x);
-	}
-	spin_unlock_bh(&net->xfrm.xfrm_state_lock);
+	xfrm_state_walk_init(&walk, 0, NULL);
+	do {
+		done = xfrm_state_walk_batch(net, &walk, &batch);
+		for (i = 0; i < batch.count; i++) {
+			x = batch.states[i];
+			if (READ_ONCE(x->xso.dev)) {
+				spin_lock_bh(&x->lock);
+				if (x->km.state != XFRM_STATE_DEAD)
+					xfrm_dev_state_update_stats(x);
+				spin_unlock_bh(&x->lock);
+			}
+			xfrm_state_put(x);
+		}
+		cond_resched();
+	} while (!done);
+	xfrm_state_walk_done(&walk, net);
 }
 
 struct xfrm_state *
@@ -2822,6 +2835,66 @@ int xfrm_state_walk(struct net *net, struct xfrm_state_walk *walk,
 }
 EXPORT_SYMBOL(xfrm_state_walk);
 
+bool xfrm_state_walk_batch(struct net *net, struct xfrm_state_walk *walk,
+			   struct xfrm_state_walk_batch *batch)
+{
+	struct xfrm_state_walk *x;
+	struct xfrm_state *state;
+	unsigned int visited = 0;
+	bool done = true;
+
+	batch->count = 0;
+	if (walk->seq != 0 && list_empty(&walk->all))
+		return true;
+
+	spin_lock_bh(&net->xfrm.xfrm_state_lock);
+	if (list_empty(&walk->all))
+		x = list_first_entry(&net->xfrm.state_all,
+				     struct xfrm_state_walk, all);
+	else
+		x = list_first_entry(&walk->all, struct xfrm_state_walk, all);
+	list_for_each_entry_from(x, &net->xfrm.state_all, all) {
+		/* Callers recheck state under x->lock before processing. */
+		if (data_race(READ_ONCE(x->state)) == XFRM_STATE_DEAD)
+			continue;
+		if (visited++ == ARRAY_SIZE(batch->states)) {
+			list_move_tail(&walk->all, &x->all);
+			done = false;
+			goto out;
+		}
+		state = container_of(x, struct xfrm_state, km);
+		if (!xfrm_id_proto_match(state->id.proto, walk->proto))
+			continue;
+		if (!__xfrm_state_filter_match(state, walk->filter))
+			continue;
+		xfrm_state_hold(state);
+		batch->states[batch->count++] = state;
+	}
+	list_del_init(&walk->all);
+out:
+	walk->seq = 1;
+	spin_unlock_bh(&net->xfrm.xfrm_state_lock);
+	return done;
+}
+EXPORT_SYMBOL(xfrm_state_walk_batch);
+
+bool xfrm_state_walk_rewind(struct xfrm_state_walk *walk, struct xfrm_state *x)
+{
+	struct net *net = xs_net(x);
+	bool linked;
+
+	lockdep_assert_held(&x->lock);
+
+	spin_lock(&net->xfrm.xfrm_state_lock);
+	linked = !hlist_unhashed(&x->bydst);
+	if (linked)
+		list_move_tail(&walk->all, &x->km.all);
+	spin_unlock(&net->xfrm.xfrm_state_lock);
+
+	return linked;
+}
+EXPORT_SYMBOL(xfrm_state_walk_rewind);
+
 void xfrm_state_walk_init(struct xfrm_state_walk *walk, u8 proto,
 			  struct xfrm_address_filter *filter)
 {
diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index 217f65faa2bd..94f73349d22d 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -1181,8 +1181,6 @@ static void copy_to_user_state(struct xfrm_state *x, struct xfrm_usersa_info *p)
 	memcpy(&p->id, &x->id, sizeof(p->id));
 	memcpy(&p->sel, &x->sel, sizeof(p->sel));
 	memcpy(&p->lft, &x->lft, sizeof(p->lft));
-	if (x->xso.dev)
-		xfrm_dev_state_update_stats(x);
 	memcpy(&p->curlft, &x->curlft, sizeof(p->curlft));
 	put_unaligned(x->stats.replay_window, &p->stats.replay_window);
 	put_unaligned(x->stats.replay, &p->stats.replay);
@@ -1566,11 +1564,34 @@ static int xfrm_dump_sa_done(struct netlink_callback *cb)
 	return 0;
 }
 
+static int refresh_and_dump_state(struct xfrm_state_walk *walk,
+				  struct xfrm_state *x,
+				  struct xfrm_dump_info *info)
+{
+	int err = 0;
+
+	spin_lock_bh(&x->lock);
+	if (x->km.state != XFRM_STATE_DEAD) {
+		xfrm_dev_state_update_stats(x);
+		err = dump_one_state(x, 0, info);
+		if (err && !xfrm_state_walk_rewind(walk, x))
+			err = 0;
+	}
+	spin_unlock_bh(&x->lock);
+
+	return err;
+}
+
 static int xfrm_dump_sa(struct sk_buff *skb, struct netlink_callback *cb)
 {
 	struct net *net = sock_net(skb->sk);
 	struct xfrm_state_walk *walk = (struct xfrm_state_walk *) &cb->args[1];
+	struct xfrm_state_walk_batch batch;
 	struct xfrm_dump_info info;
+	struct xfrm_state *x;
+	unsigned int i;
+	int err = 0;
+	bool done;
 
 	BUILD_BUG_ON(sizeof(struct xfrm_state_walk) >
 		     sizeof(cb->args) - sizeof(cb->args[0]));
@@ -1584,7 +1605,6 @@ static int xfrm_dump_sa(struct sk_buff *skb, struct netlink_callback *cb)
 		struct nlattr *attrs[XFRMA_MAX+1];
 		struct xfrm_address_filter *filter = NULL;
 		u8 proto = 0;
-		int err;
 
 		err = nlmsg_parse_deprecated(cb->nlh, 0, attrs, XFRMA_MAX,
 					     xfrma_policy, cb->extack);
@@ -1614,7 +1634,16 @@ static int xfrm_dump_sa(struct sk_buff *skb, struct netlink_callback *cb)
 		cb->args[0] = 1;
 	}
 
-	(void) xfrm_state_walk(net, walk, dump_one_state, &info);
+	do {
+		done = xfrm_state_walk_batch(net, walk, &batch);
+		for (i = 0; i < batch.count; i++) {
+			x = batch.states[i];
+			if (!err)
+				err = refresh_and_dump_state(walk, x, &info);
+			xfrm_state_put(x);
+		}
+		cond_resched();
+	} while (!done && !err);
 
 	return skb->len;
 }
@@ -1635,7 +1664,10 @@ static struct sk_buff *xfrm_state_netlink(struct sk_buff *in_skb,
 	info.nlmsg_seq = seq;
 	info.nlmsg_flags = 0;
 
+	spin_lock_bh(&x->lock);
+	xfrm_dev_state_update_stats(x);
 	err = dump_one_state(x, 0, &info);
+	spin_unlock_bh(&x->lock);
 	if (err) {
 		kfree_skb(skb);
 		return ERR_PTR(err);
@@ -3973,6 +4005,8 @@ static int build_expire(struct sk_buff *skb, struct xfrm_state *x, const struct
 	struct nlmsghdr *nlh;
 	int err;
 
+	xfrm_dev_state_update_stats(x);
+
 	nlh = nlmsg_put(skb, c->portid, 0, XFRM_MSG_EXPIRE, sizeof(*ue), 0);
 	if (nlh == NULL)
 		return -EMSGSIZE;
@@ -4170,7 +4204,10 @@ static int xfrm_notify_sa(struct xfrm_state *x, const struct km_event *c)
 
 		p = nla_data(attr);
 	}
+	spin_lock_bh(&x->lock);
+	xfrm_dev_state_update_stats(x);
 	err = copy_to_user_state_extra(x, p, skb);
+	spin_unlock_bh(&x->lock);
 	if (err)
 		goto out_free_skb;
 

base-commit: b88c75488ecc768acadb14e980bbfa087b1dbf38
-- 
2.39.3

