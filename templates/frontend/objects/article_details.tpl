{**
 * templates/frontend/objects/article_details.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article which displays all details about the article.
 *  Expected to be primary object on the page.
 *
 * @uses $article Article This article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $keywords array List of keywords assigned to this article
 * @uses $pubIdPlugins @todo
 *}
<article class="article-details">
	{* Notification that this is an old version *}
	{if $currentPublication->getId() !== $publication->getId()}
		<div class="alert alert-warning" role="alert">
			{capture assign="latestVersionUrl"}{url page="article" op="view" path=$article->getBestId()}{/capture}
			{translate key="submission.outdatedVersion" datePublished=$publication->getData('datePublished')|date_format:$dateFormatShort urlRecentVersion=$latestVersionUrl|escape }
		</div>
	{/if}

	<header>
		<h1 class="page-header border-0 font-10 text-primary-8 txtSize-8 text-center " style="line-height: 130%;">
			{$publication->getLocalizedTitle()|escape}
			{if $publication->getLocalizedData('subtitle')}
				<small>
					{$publication->getLocalizedData('subtitle')|escape}
				</small>
			{/if}
		</h1>
	</header>

	<div class="row bg-fondo-1 pb-3">
		<div class="colP-12 py-2">
			<div class="row py-3 px-3">
				{if $publication->getData('authors')}
					{foreach from=$publication->getData('authors') item=author}
						<div class="colP-md-6 py-3">
							<span class="text-danger-8 txtSize-4 N-med">
								{$author->getFullName()|escape}
							</span>
							{if $author->getOrcid()}
								<a href="{$author->getOrcid()|escape}" target="_blank">
								{$orcidIcon}
									{* $author->getOrcid()|escape 
									<img src="{$publicFilesDir}/../img_web/orcid.png" alt="Orcid" title="Orcid" height="20px">*}
								</a>
							{/if}

							{if $author->getLocalizedAffiliation()}
								<div class="article-author-affilitation txtSize-3">
									{$author->getLocalizedAffiliation()|escape}
								</div>
							{/if}
						</div>
					{/foreach}
				{/if}
			</div>
		</div>


		<div class="col-12">
			<section class="article-sidebar col-md-6 px-4">

				{* Screen-reader heading for easier navigation jumps *}
				<h2 class="sr-only">{translate key="plugins.themes.bootstrap3.article.sidebar"}</h2>

				{* Article/Issue cover image *}
				{if $publication->getLocalizedData('coverImage') || ($issue && $issue->getLocalizedCoverImage())}
					<div class="cover-image">
						{if $publication->getLocalizedData('coverImage')}
							{assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
							<img class="img-responsive"
								src="{$publication->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
								alt="{$coverImage.altText|escape|default:''}" />

							{* Para la img del art- Jc *}
							<span class="txtS-0-90 text-primary font-10" style="padding: 15px 0;">
								{$issue->getLocalizedCoverImageAltText()|escape|default:''}
							</span>

							{* Para la img del art- /Jc *}
						{else}
							<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
								<img class="img-responsive" src="{$issue->getLocalizedCoverImageUrl()|escape}"
									alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}">
							</a>
							{* Para la img del art- Jc *}
							<span class="txtS-0-90 text-primary font-10" style="padding: 15px 0;">
								{$issue->getLocalizedCoverImageAltText()|escape|default:''}
							</span>
							{* Para la img del art- /Jc *}
						{/if}
					</div>
				{/if}

				{* Article Galleys *} {*** Jc *** AJUSTANDO BOTON GALERADAS ***}
				{if $primaryGalleys || $supplementaryGalleys}
					<div class=" py-2">
						{if $primaryGalleys}
							{foreach from=$primaryGalleys item=galley}
								{include file="frontend/objects/galley_link.tpl" parent=$article purchaseFee=$currentJournal->getSetting('purchaseArticleFee') purchaseCurrency=$currentJournal->getSetting('currency')}
							{/foreach}
						{/if}
						{if $supplementaryGalleys}
							{foreach from=$supplementaryGalleys item=galley}
								{include file="frontend/objects/galley_link.tpl" parent=$article isSupplementary="1"}
							{/foreach}
						{/if}
					</div>
				{/if} {*** /Jc ***}

				<div class="list-group-item bg-fondo-1 m-0 mt-5 px-0 pt-4 border-0 text-dark font-10 txtSize-2">
					{* Licensing info *}
					{if $licenseTerms || $licenseUrl}
						{if $licenseUrl}
							{if $ccLicenseBadge}
								{$ccLicenseBadge}
							{else}
								<a href="{$licenseUrl|escape}" class="copyright text-dark">
									{if $copyrightHolder}
										{translate key="submission.copyrightStatement" copyrightHolder=$copyrightHolder copyrightYear=$copyrightYear}
									{else}
										{translate key="submission.license"}
									{/if}
								</a>
							{/if}
						{/if}
						{$licenseTerms}
					{/if}
				</div>

			</section><!-- .article-sidebar -->


			<section class="list-group col-md-6 txtS-0-90 interlineado-1-75 N-med col-md-6 px-3 font-10 txtSize-5">
				<div class="list-group border-0">

					{* Published date *}
					{if $publication->getData('datePublished')}
						<div class="list-group-item date-published bg-fondo-1 m-0 p-3">
							{capture assign=translatedDatePublished}{translate key="submissions.published"}{/capture}
							<strong>{translate key="semicolon" label=$translatedDatePublished}</strong>
							{$publication->getData('datePublished')|date_format:$dateFormatShort}
						</div>
						{* If this is an updated version *}
						{if $firstPublication->getID() !== $publication->getId()}
							<div class="list-group-item date-updated">
								{capture assign=translatedUpdated}{translate key="common.updated"}{/capture}
								<strong>{translate key="semicolon" label=$translatedUpdated}</strong>
								{$publication->getData('datePublished')|date_format:$dateFormatShort}
							</div>
						{/if}
						{* Versions *}
						{if count($article->getPublishedPublications()) > 1}
							<div class="list-group-item versions">
								<strong>{capture assign=translatedVersions}{translate key="submission.versions"}{/capture}
									{translate key="semicolon" label=$translatedVersions}</strong>
								{foreach from=array_reverse($article->getPublishedPublications()) item=iPublication}
									{capture assign="name"}{translate key="submission.versionIdentity" datePublished=$iPublication->getData('datePublished')|date_format:$dateFormatShort version=$iPublication->getData('version')}{/capture}
									<div>
										{if $iPublication->getId() === $publication->getId()}
											{$name}
										{elseif $iPublication->getId() === $currentPublication->getId()}
											<a href="{url page="article" op="view" path=$article->getBestId()}">{$name}</a>
										{else}
											<a
												href="{url page="article" op="view" path=$article->getBestId()|to_array:"version":$iPublication->getId()}">{$name}</a>
										{/if}
									</div>
								{/foreach}
							</div>
						{/if}
					{/if}

					{* DOI *}
					{assign var=doiObject value=$article->getCurrentPublication()->getData('doiObject')}
					{if $doiObject}
						{assign var="doiUrl" value=$doiObject->getData('resolvingUrl')|escape}
						<div class="list-group-item doi bg-fondo-1 m-0 p-3">
							{capture assign=translatedDoi}{translate key="doi.readerDisplayName"}{/capture}
							<strong>{translate key="semicolon" label=$translatedDoi}</strong>
							<br />
							<a href="{$doiUrl}" class="txtS-0-90">
								{$doiUrl}
							</a>
						</div>
					{/if}


					{* Issue article appears in *}
					<div class="list-group-item bg-fondo-1 m-0 p-3">
						<strong>{translate key="issue.issue"}</strong>
						<a class="title"
							href="{url|escape page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}">
							{$issue->getIssueIdentification()|escape}
						</a>
					</div>


					{if $section}
						<div class="list-group-item bg-fondo-1  m-0 p-3">
							<strong>{translate key="section.section"}</strong> :
							<span class="N-med">
								{$section->getLocalizedTitle()|escape}
							</span>
						</div>
					{/if}

					{*  MUESTRA COMO CITAR *}
					{call_hook name="Templates::Article::Details"}


			</section>


			<div class="col-md-12 bg-warning">
				<section class="article-main">
					{* Screen-reader heading for easier navigation jumps *}
					<h2 class="sr-only">{translate key="plugins.themes.bootstrap3.article.main"}</h2>
					{* Autores ANTES *}
				</section><!-- .article-main -->
			</div><!-- .col-md-8 -->
		</div>
	</div><!-- .row -->




	<div class="row">

		<div class="col-md-12">
			<section class="article-main">
				{* Screen-reader heading for easier navigation jumps *}
				<h2 class="sr-only">{translate key="plugins.themes.bootstrap3.article.main"}</h2>
				{* Autores ANTES *}

				{* Article abstract *}
				{if $publication->getLocalizedData('abstract')}
					<div class="article-summary  py-3" id="summary">
						<h2>{translate key="article.abstract"}</h2>
						<div class="font-02 txtS-1-05 interlineado-1-75 px-5">
							{$publication->getLocalizedData('abstract')|strip_unsafe_html|nl2br}
						</div>
					</div>
				{/if}

				{* Keywords *}
				{if !empty($publication->getLocalizedData('keywords'))}
					{* <div class="list-group-item keywords"> *}
					<span class="h2">{capture assign=translatedKeywords}{translate key="article.subject"}{/capture}
						{translate key="semicolon" label=$translatedKeywords}</span>
					<div class="font-02 txtS-1-05 interlineado-1-75 px-5">
						<div class="col my-0 py-1 article-abstract">
							{foreach from=$keywords[$currentLocale] item=keyword}
								{if $smarty.foreach.keywords.last}<span class="text-gray-2">• </span>{/if}
								{foreach name=keywords from=$keyword item=keywordItem}
									{$keywordItem|escape}
								{/foreach}
							{/foreach}
						</div>
					</div>
					<br />
					{* </div> *}
				{/if}

				{* - Jc - Líne para visualizar bloque de metricas y estadísticas*}
				<div class="panel panel-default author-bios">
					<div class="panel-heading">
						Metrícas
					</div>
					<div class="panel-body">
						<div class="media biography p-0">
							<div class="media-body p-0 m-0">
								<div class="row m-0 p-0">
									{* <h3 class="media-heading biography-author">
									</h3> *}

									{call_hook name="Templates::Article::Main"}

									{* Usage statistics chart*}
									{if $activeTheme->getOption('displayStats') != 'none'}
										{$activeTheme->displayUsageStatsGraph($article->getId())}
										<section class="colP-12 item downloads_chart ">
											<h2 class="label">
												{translate key="plugins.themes.bootstrap3.displayStats.downloads"}
											</h2>
											<div class="value">
												<canvas class="usageStatsGraph" data-object-type="Submission"
													data-object-id="{$article->getId()|escape}"></canvas>
												<div class="usageStatsUnavailable" data-object-type="Submission"
													data-object-id="{$article->getId()|escape}">
													{translate key="plugins.themes.bootstrap3.displayStats.noStats"}
												</div>
											</div>
										</section>

									{/if}
								</div>
							</div>
						</div>
					</div>
				</div>


			</section><!-- .article-main -->

			<section class="article-more-details">

				{* Screen-reader heading for easier navigation jumps *}
				<h2 class="sr-only">{translate key="plugins.themes.bootstrap3.article.details"}</h2>

				{* PubIds (requires plugins) *}
				{foreach from=$pubIdPlugins item=pubIdPlugin}
					{if $pubIdPlugin->getPubIdType() == 'doi'}
						{continue}
					{/if}
					{if $issue->getPublished()}
						{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
					{else}
						{assign var=pubId value=$pubIdPlugin->getPubId($article)}{* Preview pubId *}
					{/if}
					{if $pubId}
						<div class="panel panel-default pub_ids">
							<div class="panel-heading">
								<h2 class="panel-title">
									{$pubIdPlugin->getPubIdDisplayType()|escape}
								</h2>
							</div>
							<div class="panel-body">
								{if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
									<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}"
										href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">
										{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
									</a>
								{else}
									{$pubId|escape}
								{/if}
							</div>
						</div>
					{/if}
				{/foreach}

				{* Issue article appears in *}
				{* {if $issue}
					<div class="panel panel-default issue">
						<div class="panel-heading">
							<h2 class="panel-title">
								{translate key="issue.issue"}
							</h2>
						</div>
						<div class="panel-body">
							<a class="title" href="{url|escape page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}">
								{$issue->getIssueIdentification()|escape}
							</a>
						</div>
					</div>
				{/if} *}

				{* {if $section}
					<div class="panel panel-default section">
						<div class="panel-heading">
							<h2 class="panel-title">
								{translate key="section.section"}
							</h2>
						</div>
						<div class="panel-body">
							{$section->getLocalizedTitle()|escape}
						</div>
					</div>
				{/if}
				*}

				{* Licensing info *}
				{*{if $licenseTerms || $licenseUrl}
					<div class="panel panel-default copyright">
						<div class="panel-body">
							{if $licenseUrl}
								{if $ccLicenseBadge}
									{$ccLicenseBadge}
								{else}
									<a href="{$licenseUrl|escape}" class="copyright">
										{if $copyrightHolder}
											{translate key="submission.copyrightStatement" copyrightHolder=$copyrightHolder copyrightYear=$copyrightYear}
										{else}
											{translate key="submission.license"}
										{/if}
									</a>
								{/if}
							{/if}
							{$licenseTerms}
						</div>
					</div>
				{/if}
				*}

				{* Author biographies *}
				{assign var="hasBiographies" value=0}
				{foreach from=$publication->getData('authors') item=author}
					{if $author->getLocalizedBiography()}
						{assign var="hasBiographies" value=$hasBiographies+1}
					{/if}
				{/foreach}
				{if $hasBiographies}
					<div class="panel panel-default author-bios">
						<div class="panel-heading">
							<h2 class="panel-title">
								{if $hasBiographies > 1}
									{translate key="submission.authorBiographies"}
								{else}
									{translate key="submission.authorBiography"}
								{/if}
							</h2>
						</div>
						<div class="panel-body">
							{foreach from=$publication->getData('authors') item=author}
								{if $author->getLocalizedBiography()}
									<div class="media biography">
										<div class="media-body">
											<h3 class="media-heading biography-author">
												{if $author->getLocalizedAffiliation()}
													{capture assign="authorName"}{$author->getFullName()|escape}{/capture}
													{capture assign="authorAffiliation"}<span
														class="affiliation">{$author->getLocalizedAffiliation()|escape}</span>{/capture}
													{translate key="submission.authorWithAffiliation" name=$authorName affiliation=$authorAffiliation}
												{else}
													{$author->getFullName()|escape}
												{/if}
											</h3>
											{$author->getLocalizedBiography()|strip_unsafe_html}
										</div>
									</div>
								{/if}
							{/foreach}
						</div>
					</div>
				{/if}

				{* MUESTRA COMO CITAR
				{call_hook name="Templates::Article::Details"}
				*}


			</section><!-- .article-details -->
		</div><!-- .col-md-12 -->


		<div class="col-md-12">

			{* References *} {* Referencias AHORA *}
			{if $parsedCitations || $publication->getData('citationsRaw')}
				<div class="article-references">
					<p>
					<h3>
						<a class="btn btn-primary txtS-0-95 px-5" data-toggle="collapse" href="#collapseExample"
							role="button" aria-expanded="false" aria-controls="collapseExample">
							{translate key="submission.citations"}
						</a>
					</h3>
					</p>

					<div class="collapse " id="collapseExample">
						<div class="bg-fondo-1 px-5 py-3 m-0">
							{if $parsedCitations}
								{foreach from=$parsedCitations item="parsedCitation"}
									<p>{$parsedCitation->getCitationWithLinks()|strip_unsafe_html}
										{call_hook name="Templates::Article::Details::Reference" citation=$parsedCitation}</p>
								{/foreach}
							{else}
								{$publication->getData('citationsRaw')|nl2br}
							{/if}
						</div>
					</div>

					<div class="article-references-content small">

					</div>
				</div>
			{/if}



			{* <section class="article-main"> *}

			{* Screen-reader heading for easier navigation jumps *}
			{*<h2 class="sr-only">{translate key="plugins.themes.bootstrap3.article.main"}</h2>

				 {if $publication->getData('authors')}
					<div class="authors">
						{foreach from=$publication->getData('authors') item=author}
							<div class="author">
								<strong>{$author->getFullName()|escape}</strong>
								{if $author->getLocalizedAffiliation()}
									<div class="article-author-affiliation">
										{$author->getLocalizedAffiliation()|escape}
									</div>
								{/if}
								{if $author->getOrcid()}
									<div class="orcid">
										{if $author->getData('orcidAccessToken')}
											{$orcidIcon}
										{/if}
										<a href="{$author->getOrcid()|escape}" target="_blank">
											{$author->getOrcid()|escape}
										</a>
									</div>
								{/if}
							</div>
						{/foreach}
					</div>
				{/if} *}





			{* </section><!-- .article-main --> *}


		</div><!-- .col-md-8 -->
	</div><!-- .row -->

</article>