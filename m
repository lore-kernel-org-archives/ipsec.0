Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222207;
	b=QMnqAQAEUEkCDjRyr/KHfzjaWs5LB8UI0xHKscIbDp8Pw9wjMqGFmYN8KqyXt5RH+r9W
	 +RzwmzUAW5o9YB/rOEFq+ujkQuuSzoJM7MEspOQ5ji/mvr2XlxkOl+lYEiqaGg6sPmDUC
	 IddUv3nHCg7GvCuzqszZpECsgLl+r2eE5Etyy4oAXTLb0alvoj30YnvGl32KicPuACCee
	 sChDs6c0kD142pdXDD9v6hmvopRs4GoSUIQ06Puk69BS0gZc0YrlkNvEtNpZUKozZ4atX
	 LDmRrqp8ad0vPhoT1B2hzi2qigRYncISZY1R/7YoXdA999yTvXBubT29B3o51G5iNMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222207;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=x5TY+SM7qkwMcQwh0D2+P0XzJGJsd0xUaX7HuvxPsfE=;
	b=AWKwVCalRe2V5+gwupUMlOEzMCreisWaSlo3+DKvTnTM0v/tuHGnh4oHdwUaXfAHuZSl
	 hf1GoVGslA/1usF1LqhStzCgRs++KVbOxs2iJTV9eOsSABQuqhmbC+Kiz7R5OXqlg+cVV
	 1M4LhI84lFt+9K34lXQ+8LnpPQ/+iR/g1Ri1+7Z/NujbLaMxnEmFniowFxPsDPFotF1E9
	 y8Jj03GvRSeRTH8H5XH7SpbTSOAMgi+SkE3FTB8geG/p4n8xKWHpbwbc+8cg5j0PafStU
	 yYPWddmaNM5lcID8mjkGjpb3jf6TtvLE/PH1BfmkKpXUa+bE8WdcNvF7PEy3DqUekgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XgwTG4NP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA58606A332;
	Sat, 21 Nov 2026 00:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XgwTG4NP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D0D1F000C6;
	Sat, 21 Nov 2026 00:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795222206;
	bh=x5TY+SM7qkwMcQwh0D2+P0XzJGJsd0xUaX7HuvxPsfE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XgwTG4NP8fJuSPnHnLt2rwqcXhcHTJdGApMNC07MJjHaDQxo1BnhrFdyQOvi6qxna
	 BlWrMiOy6eYr4IZ2h9LMuXPIZylgM/Uaky1xt0ltvHSJCOT7ncsxt6K/Y3010psBNl
	 QTtKzv57furrbM3jENE8Smi7BENz2Q8bJoLobqda6a11F9WmIGWl84ukD5g//Ymqtf
	 rJJo6505jsjkkXbGKa8FSyD9pZVVm5CLkjimhhgrrgYrVfMz0BtahUDEI8CrIzmzt2
	 21d2KVYIfDmc/w/J03FqByMUH/wLEqOQo2uNmgF6TZfLbqylxTdfHsxg/MVJ161eRU
	 kHEtPrDrEY8ww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77460380AA4D;
	Sat, 21 Nov 2026 00:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [PATCH net v3] net: clear skb->mac_len in skb_unset_mac_header()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522220528.862800.13274305638733891749.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 00:50:05 +0000
References: <20261117143612.95112-1-piyus@iiitd.ac.in>
In-Reply-To: <20261117143612.95112-1-piyus@iiitd.ac.in>
To: Piyus Kedia <piyus@iiitd.ac.in>
Cc: edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, andrea.mayer@uniroma2.it,
 netdev@vger.kernel.org, ipsec@lists.linux.dev, linux-kernel@vger.kernel.org,
 kapil@presceralabs.ai

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Nov 2026 20:06:12 +0530 you wrote:
> From: Eric Dumazet <edumazet@kernel.org>
> 
> skb_unset_mac_header() marks the mac header as unset but leaves
> skb->mac_len alone, so an skb can end up with no mac header and a
> non-zero mac_len. Code that uses mac_len to decide whether a mac
> header is present is then misled.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: clear skb->mac_len in skb_unset_mac_header()
    https://git.kernel.org/netdev/net/c/7a505bb0168a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


