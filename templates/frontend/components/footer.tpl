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

{* --- Jc --- *}
{* INCLUIR JS DE BOOSTRAP *}
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous">
</script>

{* --- Jc --- *}
{* Iconos de Google API, para accesibilidad*}
{* Los nombres de deben ordenar alfabeticamente*}
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=accessible_forward,contrast,dark_mode,filter_b_and_w,highlight_keyboard_focus,invert_colors,link,monochrome_photos,settings_backup_restore,text_decrease,text_increase" />

{call_hook name="Templates::Common::Footer::PageFooter"}

{* --- Jc --- *}
{* Esto es para accesibilidad *}
<svg width="0" height="0" style="position:absolute">
	<filter id="protanopia">
		<feColorMatrix type="matrix" values="0.567 0.433 0     0 0 
              0.558 0.442 0     0 0 
              0     0.242 0.758 0 0 
              0     0     0     1 0" />
	</filter>

	<filter id="deuteranopia">
		<feColorMatrix type="matrix" values="0.625 0.375 0     0 0 
              0.7   0.3   0     0 0 
              0     0.3   0.7   0 0 
              0     0     0     1 0" />
	</filter>

	<filter id="tritanopia">
		<feColorMatrix type="matrix" values="0.95  0.05  0     0 0 
              0     0.433 0.567 0 0 
              0     0.475 0.525 0 0 
              0     0     0     1 0" />
	</filter>
</svg>
</body>

</html>