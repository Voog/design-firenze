{% if site.search.enabled %}
  <div class="search js-search">
    <div class="search-middle">
      <div class="search-inner js-search-inner">
        <form id="search" class="search-form js-search-form" method="get" action="#">
          <input id="onpage_search" class="search-input js-search-input" type="text" placeholder="{{ 'search_this_site' | lc }}">

          <button class="search-submit js-search-submit">
            <svg width="20px" height="21px" viewbox="0 0 20 21" xmlns="http://www.w3.org/2000/svg">
              <path d="M20,17.898 C20,18.527 19.755,19.118 19.31,19.563 C18.865,20.008 18.274,20.253 17.645,20.253 C17.016,20.253 16.425,20.008 15.98,19.563 C15.98,19.563 11.945,15.528 11.945,15.528 C10.825,16.101 9.56,16.431 8.215,16.431 C3.678,16.431 0,12.752 0,8.215 C0,3.678 3.678,0 8.215,0 C12.753,0 16.431,3.678 16.431,8.215 C16.431,9.693 16.035,11.077 15.352,12.275 C15.352,12.275 19.31,16.233 19.31,16.233 C19.755,16.678 20,17.269 20,17.898 ZM8.216,1.978 C4.77,1.978 1.976,4.772 1.976,8.219 C1.976,11.665 4.77,14.459 8.216,14.459 C11.663,14.459 14.457,11.665 14.457,8.219 C14.457,4.772 11.663,1.978 8.216,1.978 Z "></path>
            </svg>
          </button>
        </form>

        <button class="search-btn search-close-btn js-search-close-btn">
          <svg width="16px" height="16px" viewbox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
            <path d="M15.205,2.743 C15.205,2.743 10.03,7.918 10.03,7.918 C10.03,7.918 15.109,12.997 15.109,12.997 C15.695,13.583 15.694,14.533 15.109,15.118 C14.523,15.704 13.574,15.704 12.988,15.118 C12.988,15.118 7.909,10.039 7.909,10.039 C7.909,10.039 2.743,15.205 2.743,15.205 C2.149,15.799 1.187,15.799 0.594,15.205 C0,14.612 0,13.65 0.594,13.056 C0.594,13.056 5.759,7.89 5.759,7.89 C5.759,7.89 0.674,2.805 0.674,2.805 C0.088,2.218 0.088,1.269 0.674,0.683 C1.259,0.098 2.209,0.097 2.795,0.683 C2.795,0.683 7.881,5.769 7.881,5.769 C7.881,5.769 13.055,0.594 13.055,0.594 C13.649,0 14.611,0.001 15.205,0.594 C15.798,1.188 15.799,2.149 15.205,2.743 Z "></path>
          </svg>
        </button>

        <div class="voog-search-modal js-voog-search-modal"></div>
      </div>
    </div>
  </div>
{% endif %}
