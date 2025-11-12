{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University Library
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $authorUserGroups Traversible The set of author user groups
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showGalleyLinks bool Show galley links to users without access?
 * @uses $hideGalleys bool Hide the article galleys for this article?
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 *}
{assign var=publication value=$article->getCurrentPublication()}
{assign var=articlePath value=$article->getBestId($currentJournal)}
{if (!$section.hideAuthor && $article->getHideAuthor() == \APP\submission\Submission::AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == \APP\submission\Submission::AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}

{* - Jc - En esta sección se modifica la estructura y varios estilos*}


<div class="row p-4 my-2">
	{if $publication->getLocalizedData('coverImage')}
		{assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
		<div class="colP-6 colP-sm-6 colP-md-3 colP-lg-2 p-0">
			<a href="{if $journal}{url journal=$journal->getPath() page="article" op="view" path=$articlePath}{else}{url page="article" op="view" path=$articlePath}{/if}" class="file">
				<img class="img-fluid" src="{$publication->getLocalizedCoverImageUrl($currentContext->getId())|escape}" alt="{$coverImage.altText|escape|default:''}">
			</a>
		</div>
	{/if}

	<div class="colP-12 colP-sm-12 colP-md-11 colP-lg-10">
		<h3 class="media-heading">
            <a href="{if $journal}{url journal=$journal->getPath() page="article" op="view" path=$articlePath}{else}{url page="article" op="view" path=$articlePath}{/if}" class="text-primary txtSize-7">
				{$article->getLocalizedTitle()|strip_unsafe_html}
				{* - Jc - Estílo para *}
				{if $article->getLocalizedSubtitle()}
					<p>
						<small>{$article->getLocalizedSubtitle()|escape}</small>
					</p>
				{/if}
			</a>
		</h3>

		{* - Jc - Article abstract MINI *}
		<div class="txtSize-3 font-01 text-primary-9">
			{$article->getLocalizedAbstract()|strip_unsafe_html|truncate:250:"...":false }
		</div>
		{* - Jc - *}

		{if $showAuthor || $article->getPages()}

			{if $showAuthor}
				<div class="meta">
					{if $showAuthor}
						<div class="authors text-danger-8 txtSize-3 N-med">
							{$article->getCurrentPublication()->getAuthorString($authorUserGroups)|escape}
						</div>
					{/if}
				</div>
			{/if}


			{* Page numbers for this article *}
			{*  - Jc - CANCELAR NUMERACION DE ARTÍCULOS

			{if $article->getPages()}
				<p class="pages">
					{$article->getPages()|escape}
				</p>
			{/if}
			*}

		{/if}

		{if !$hideGalleys && $article->getGalleys()}
			<div class="btn-group" role="group">
				{foreach from=$article->getGalleys() item=galley}
					{if $primaryGenreIds}
						{assign var="file" value=$galley->getFile()}
						{if !$galley->getRemoteUrl() && !($file && in_array($file->getGenreId(), $primaryGenreIds))}
							{continue}
						{/if}
					{/if}
					{assign var=publication value=$article->getCurrentPublication()}
					{assign var="hasArticleAccess" value=$hasAccess}
					{if $currentContext->getSetting('publishingMode') == \APP\journal\Journal::PUBLISHING_MODE_OPEN || $publication->getData('accessStatus') == \APP\submission\Submission::ARTICLE_ACCESS_OPEN}
						{assign var="hasArticleAccess" value=1}
					{/if}
					{* - Jc - Ocultar GALERADAS 
					{include file="frontend/objects/galley_link.tpl" parent=$article hasAccess=$hasArticleAccess}
					*}

				{/foreach}
			</div>
		{/if}
	</div>

	{call_hook name="Templates::Issue::Issue::Article"}
</div><!-- .article-summary -->
