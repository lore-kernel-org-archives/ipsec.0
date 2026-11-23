Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433020;
	b=35+4jwNbsmt15MMsegDQBKH4mcC5rn0hIqRAYAbTqokgesRMXwXOx6+8Ppsf+K2JWIof
	 9Vtz5CfEmkZdBvO/uCYGF94JhPTQ37jWn3lC8Q/l7K4qCM7OWHTHSyiTOghyuhvPS1VvT
	 8LsyyQqhn20PQL4sJKT8QyQyZbWxAmu12grWFJfEHdlFjYMEmfmqKAHnSEwijyKfbu7wh
	 OazSGlN9wI5hW27muse7relFK7SAaaGduhvNqSfLKesp5ZbSk4OnDVoUc5vyQkk8QR1wt
	 9iMO/6kJfqDQbERkMhfd24wu92mzamm0PQtMceg1v+GFfUovkTZFoZByH6GlpCmIYWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433020;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=Bum+lssZPEFatuL2bG+N1NnJsQw7nXk0ur3WJ+ACVtg=;
	b=zWOLv0izOwPVQaGoitcEf0V1KSJoHE1hXw/4h2oo+YklCbbVkN1osffq2pdHCotZOn3t
	 wEc+mWG/0FS1/NBZZ3ACtOktLoijfInI+rKqQ0QEw3s3FAyWEOIqy8H8OuunPcxvIaQ4K
	 IlEecOLm5R5Ej+afHxGrN856WY51jbkL/eRclXbSJR3UUdivK5V4+qn7terOhcMB6Mr1L
	 r0Mzj9FQuIp7eh6Y8LALA/uuQMewSlTrM5ueZACl5ciYo0woZ74+l3W5kZlF3pQOHajz6
	 P8wN7ww7tBXZUY308MvQlud75NVr3JWtNYspZLrzLYjlIs4NOuVEtFXJAWVaOW720gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=HzqUGRGG;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6139E606A31F
	for <ipsec@lists.linux.dev>; Mon, 23 Nov 2026 11:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6139E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=HzqUGRGG
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 8950020728;
	Mon, 23 Nov 2026 12:23:37 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id REJH_RAY6Ms5; Mon, 23 Nov 2026 12:23:36 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id A3DC9201C7;
	Mon, 23 Nov 2026 12:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com A3DC9201C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795433016;
	bh=Bum+lssZPEFatuL2bG+N1NnJsQw7nXk0ur3WJ+ACVtg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=HzqUGRGG69t1azuhLafPq7isOoKAcz2QJREEgF44pc92J4ctrvIi9y7YJjsenc8Sr
	 d1zizrlAdlKomgV1OMLUtzqkkPsjviu8UzWpr8BGV+UypsVR/7p8nRdk5L/Wm4zvIg
	 EOwK0wswzgk2AG/hX5KUdjm3pWfP+inIs9+vhEGJ0ZBRDPg7ClEq9LTovzD0Wv0W7i
	 PMB5hBjVlXuPRxZzAFx/1vRO1DPOSUWnPqaktxcX8S/VeucVY+dlzpEaJ4S//1kwUB
	 jiHxViEnLbKy9cqoVdOTePhjMKFqelrnsNq1q1h/ZU0+SaqwQvEtZnF6IRRJjP3WXy
	 qgyzQFKn4R0wA==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 23 Nov
 2026 12:23:35 +0100
Received: (nullmailer pid 2092840 invoked by uid 1000);
	Mon, 23 Nov 2026 11:23:35 -0000
Date: Mon, 23 Nov 2026 12:23:35 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>, Christian Hopps
	<chopps@labn.net>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	<netdev@vger.kernel.org>, <ipsec@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>,
	<syzbot+622de7e1f18a30fc404a@syzkaller.appspotmail.com>
Subject: Re: [PATCH ipsec] xfrm: iptfs: force a dst reference before queueing
 an skb
Message-ID: <awQiN-6b40NOCVFV@gauss4>
References: <20261115132611.427311-1-ngocthang2710.1999@gmail.com>
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261115132611.427311-1-ngocthang2710.1999@gmail.com>
X-ClientProxiedBy: EXCH-02.secunet.de (10.32.0.172) To EXCH-01.secunet.de
 (10.32.0.171)

On Sun, Nov 15, 2026 at 08:26:11PM +0700, Nguyen Ngoc Thang wrote:
> iptfs_output_collect() is the dst->output hook and runs under the
> caller's RCU read lock. It queues the skb and sends it later from the
> iptfs hrtimer. The skb may still carry a noref dst, e.g. one set by
> __ip_queue_xmit() via skb_dst_set_noref(). Once the RCU section ends,
> nothing keeps that dst alive.
> 
> When the timer fires, xfrm_output_one() calls skb_dst_force() outside
> any RCU section:
> 
>   WARNING: include/net/dst.h:326 at xfrm_output_resume+0x41d9/0x64e0
>   Call Trace:
>    xfrm_output_one net/xfrm/xfrm_output.c:549 [inline]
>    xfrm_output_resume+0x41d9/0x64e0 net/xfrm/xfrm_output.c:597
>    iptfs_output_queued net/xfrm/xfrm_iptfs.c:2325 [inline]
>    iptfs_delay_timer+0x3803/0x4310 net/xfrm/xfrm_iptfs.c:2362
>    __run_hrtimer kernel/time/hrtimer.c [inline]
>    __hrtimer_run_queues+0x3bc/0xa10 kernel/time/hrtimer.c
>    hrtimer_run_softirq+0x1e3/0x2e0 kernel/time/hrtimer.c:2153
>    handle_softirqs+0x265/0x8d0 kernel/softirq.c:669
> 
> The warning also means the queued skb may point to a dst that has
> already been freed.
> 
> Take a reference with skb_dst_force() while still under RCU, as other
> deferred xmit paths do, and drop the skb if its dst is already gone.
> 
> Fixes: 0e4fbf013fa5 ("xfrm: iptfs: add user packet (tunnel ingress) handling")
> Reported-by: syzbot+622de7e1f18a30fc404a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=622de7e1f18a30fc404a
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

Applied, thanks a lot!
