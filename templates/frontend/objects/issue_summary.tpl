{**
 * templates/frontend/objects/issue_summary.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists
 *
 * @uses $issue Issue The issue
 *}

{* - Jc - Ajustar columna para SM y MD para mostrar Archivos *}
{* VOLUMENES ANTERIORES *}

<div class="colP-sm-12 colP-md-6 colP-lg-4 py-3 px-2">
	<div class="p-3 py-4">

		{* Retrieve separate entries for $issueTitle and $issueSeries *}
		{assign var=issueTitle value=$issue->getLocalizedTitle()}
		{assign var=issueSeries value=$issue->getIssueSeries()}
		{assign var=issueDescription value=$issue->getLocalizedDescription()}

		{* Show cover image and use cover description *}
		<div class="m-0 p-0" style="width: 18rem;">
			{if $issue->getLocalizedCoverImage()}
				<div class="m-0 px-2 py-0">
					<a class="cover" href="{url|escape op="view" path=$issue->getBestIssueId($currentJournal)}">
						<img class="img-fluid" src="{$issue->getLocalizedCoverImageUrl()|escape}"
							alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}">
					</a>
				</div>
			{/if}


			<div class="py-0 text-center m-0  ">
				<h2 class="card-title pt-3 pb-1 m-0">
					<a class="title" href="{url|escape op="view" path=$issue->getBestIssueId($currentJournal)}">
						{if $issueTitle}
							<div class="text-primary txtSize-4">
								{$issueSeries|escape}
							</div>
						{else}
							{$issueSeries|escape}
						{/if}
					</a>
				</h2>
				<div class="txtSize-2 font-04 text-primary-5 N-med">
					{if $issueTitle}
						{if $issueTitle}
							{$issueTitle|escape}
						{else}
							{$issueSeries|escape}
						{/if }
					{/if}
				</div>

				<div class="description">
					{$issueDescription|strip_unsafe_html|nl2br}
				</div>
			</div>
		</div>
	</div>
</div><!-- .issue-summary -->