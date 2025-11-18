{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

</main>

{* Sidebars *}
{if empty($isFullWidth)}
	{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
	{if $sidebarCode}
		<aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-sm-8 col-md-4" role="complementary"
			aria-label="{translate|escape key="common.navigation.sidebar"}">
			{$sidebarCode}
		</aside><!-- pkp_sidebar.left -->
	{/if}
{/if}
</div><!-- pkp_structure_content -->

{* <footer class="footer" role="contentinfo">

		<div class="container">

			<div class="row">
				{if $pageFooter}
				<div class="col-md-10">
					{$pageFooter}
				</div>
				{/if}

				<div class="col-md-2" role="complementary">
					<a href="{url page="about" op="aboutThisPublishingSystem"}">
                                                <img class="img-responsive" alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}">
                                        </a>
				</div>

			</div> <!-- .row -->
		</div><!-- .container -->
	</footer> *}
{* - Jc - Ajustar bordes e interlineado del pie de página *}
<footer class="footer" role="contentinfo">
	<div>
		<div class="container">
			<div class="row">

				<div class="col-md-12 font-01 interlineado-1-75 text-center text-info py-5">
					<span class="px-4 txtS-1-50">
						<a class="txt-link-1" href="https://www.facebook.com/PyfCIMSUR" target="_blank">
							<i class="fa-brands fa-facebook-f txtS-1-60"></i>
						</a>
					</span>
					<span class="px-4 txtS-1-50">
						<a class="txt-link-1" href="https://www.youtube.com/@revistapueblosyfronterasdi6411"
							target="_blank">
							<i class="fa-brands fa-youtube txtS-1-60 "></i>
						</a>
					</span>
					<span class="px-4 txtS-1-50">
						<a class="txt-link-1"
							href="https://twitter.com/i/flow/login?redirect_after_login=%2Frevista_pyfd"
							target="_blank">
							<i class="fa-brands fa-x-twitter txtS-1-60"></i>
						</a>
					</span>
				</div>

				{* - Jc - Ajustar fuente del texto del footer *}
				{if $pageFooter}
					<div class="col-md-12 txtSize-4 font-10 interlineado-1-75 N-med ">
						{$pageFooter}
					</div>
				{/if}
				{* - /Jc - *}

				{* - Jc - Quitar logo OJS *}
				{* 
				<div class="col-md-2" role="complementary">
					<a href="{url page="about" op="aboutThisPublishingSystem"}">
                                                <img class="img-responsive" alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}">
                                        </a>
				</div>
				*}

			</div> <!-- .row -->
		</div>
	</div><!-- .container -->
</footer>
</div><!-- pkp_structure_page -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>

</html>