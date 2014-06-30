{% if site.search.enabled %}
  <div class="search js-search">
    <div class="search-middle">
      <div class="search-inner js-search-inner">
        <form id="search" class="search-form js-search-form" method="get" action="#">
          <input id="onpage_search" class="search-input js-search-input" type="text" placeholder="search this site...">
          <!-- <input class="search-submit js-search-submit" type="submit" value="" name=""> -->
          <button class="search-submit js-search-submit">
            <svg xmlns="http://www.w3.org/2000/svg" height="21px" width="20px">
              <path d="M20,17.898 C20,18.527 19.755,19.118 19.31,19.563 C18.865,20.008 18.274,20.253 17.645,20.253 C17.016,20.253 16.425,20.008 15.98,19.563 C15.98,19.563 11.945,15.528 11.945,15.528 C10.825,16.101 9.56,16.431 8.215,16.431 C3.678,16.431 0,12.752 0,8.215 C0,3.678 3.678,0 8.215,0 C12.753,0 16.431,3.678 16.431,8.215 C16.431,9.693 16.035,11.077 15.352,12.275 C15.352,12.275 19.31,16.233 19.31,16.233 C19.755,16.678 20,17.269 20,17.898 ZM8.216,1.978 C4.77,1.978 1.976,4.772 1.976,8.219 C1.976,11.665 4.77,14.459 8.216,14.459 C11.663,14.459 14.457,11.665 14.457,8.219 C14.457,4.772 11.663,1.978 8.216,1.978 Z "/>
            </svg>
          </button>
        </form>

        <div class="voog-search-modal js-voog-search-modal"></div>
      </div>
    </div>
  </div>
{% endif %}
