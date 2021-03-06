{include file='header' pageTitle='wcf.acp.menu.link.user.customnotifications.list'}

<header class="contentHeader">
	<div class="contentHeaderTitle">
		<h1 class="contentTitle">{lang}wcf.acp.menu.link.user.customnotifications.list{/lang}</h1>
	</div>

	<nav class="contentHeaderNavigation">
		<ul>
			<li><a href="{link controller='CustomNotificationSend'}{/link}" class="button"><span class="icon icon16 fa-plus"></span> <span>{lang}wcf.acp.menu.link.user.customnotifications.add{/lang}</span></a></li>

			{event name='contentHeaderNavigation'}
		</ul>
	</nav>
</header>

{if $items}
	{foreach from=$objects item=notification}
		<section class="section jsNotification">
			<header class="sectionHeader">
				<h2 class="sectionTitle">
					{if !$notification->isNotification}
						<span class="icon icon24 fa-bullhorn jsTooltip" title="{lang}wcf.acp.wsc_connect.notification.custom.type.push{/lang}"></span>
					{else}
						<span class="icon icon24 fa-bell-o jsTooltip" title="{lang}wcf.acp.wsc_connect.notification.custom.type.notification{/lang}"></span>
					{/if}

					{$notification->getTitle()}
				</h2>

				<div class="sectionDescription">
					<ul class="inlineList">
						<li class="recipients"><span class="icon icon16 fa-users"></span> {$notification->recipientUsernames}</li>
						<li><span class="icon icon16 fa-clock-o"></span> {@$notification->time|time}</li>
						<li><span class="icon icon16 fa-user"></span> {$notification->username}</li>
						{if $notification->url}<li><span class="icon icon16 fa-link"></span> <a href="{$notification->url}" target="_blank">{$notification->url}</a></li>{/if}
						<li><span class="icon icon16 {if $notification->hasSucceeded}fa-check{else}fa-refresh{/if}"></span></li>
					</ul>
				</div>
			</header>

			<div class="notificationContent">
				{@$notification->getMessage(true)}
			</div>
		</section>
	{/foreach}
{else}
	<div class="info">{lang}wcf.acp.wsc_connect.notification.custom.noItems{/lang}</div>
{/if}

{include file='footer'}
