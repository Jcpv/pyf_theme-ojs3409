{**
 * templates/frontend/components/searchForm_simple.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Simple display of a search form with just text input and search button
 *
 * @uses $searchQuery string Previously input search query
 *}
 {* --- Jc --- *}
 {* Modificando el FRM de buscar *}
{if !$currentJournal || $currentJournal->getData('publishingMode') != \APP\journal\Journal::PUBLISHING_MODE_NONE}
  <form class="navbar-form navbar-left" role="search" method="post" action="{url page="search" op="search"}">
    {* <div class="form-group">
      <input class="form-control" name="query" value="{$searchQuery|escape}" type="search"
        aria-label="{translate|escape key="common.searchQuery"}" placeholder="">
    </div> *}
    <button type="submit" class="btn btn-primary p-3 m-0 border border-white ">
      <span class="txtS-1-30">
        <i class="fas fa-search"></i>
        {*translate key="common.search"*}
      </span>
    </button>
  </form>
{/if}