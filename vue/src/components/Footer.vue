<template>
    <footer class="footer">
        <div class="contact-info">
            <div style="font-size: 18px;">
                <strong>Contact Us</strong> <br />
                <a href="tel:(877) 606-3203">(877) 606-3203</a> <br />
                <a href="mailto:hello@techelevator.com" class="standard-email">hello@techelevator.com</a>
            </div>
            <ul id="social-icons">
                <li><a href="https://www.facebook.com/techelevator" target="_blank"> <img src="../assets/facebook-logo.png"
                            alt="fb-logo"></a></li>
                <li><a href="https://twitter.com/Tech_Elevator" target="_blank"> <img src="../assets/twitter-logo.png"
                            alt="twt-logo"></a></li>
                <li><a href="https://www.instagram.com/techelevator/" target="_blank"> <img
                            src="../assets/instagram-logo.png" alt="insta-logo"></a></li>
                <li><a href="https://www.linkedin.com/school/tech-elevator/" target="_blank"> <img
                            src="../assets/linkedin-logo.png" alt="link-logo"></a></li>
                <li><a href="https://www.youtube.com/techelevator" target="_blank"> <img src="../assets/youtube-logo.png"
                            alt="ytb-logo"></a></li>
            </ul>
            <div>
                <a href="https://www.techelevator.com/privacy-policy/">Privacy Policy</a>
            </div>
        </div>
        <div class="locations-menu">
            <div class="menu-footer-menu-container">
                <ul id="menu-footer-menu" class="menu">
                    <!-- Featured Locations -->
                    <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children">
                        <a href="https://www.techelevator.com/bootcamp-near-me/">Featured Locations</a>
                        <ul class="sub-menu">
                            <li class="menu-item menu-item-type-post_type menu-item-object-bootcamp"
                                id="menu-item-169872248">
                                <a
                                    href="https://www.techelevator.com/locations/coding-bootcamp-cincinnati-ohio/">Cincinnati</a>
                            </li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-bootcamp"
                                id="menu-item-169872251">
                                <a
                                    href="https://www.techelevator.com/locations/coding-bootcamp-cleveland-ohio/">Cleveland</a>
                            </li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-bootcamp"
                                id="menu-item-169872249">
                                <a href="https://www.techelevator.com/locations/coding-bootcamp-columbus-ohio/">Columbus</a>
                            </li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-bootcamp"
                                id="menu-item-169872245">
                                <a
                                    href="https://www.techelevator.com/locations/coding-bootcamp-detroit-michigan/">Detroit</a>
                            </li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-bootcamp"
                                id="menu-item-169872250">
                                <a
                                    href="https://www.techelevator.com/locations/coding-bootcamp-pittsburgh-pennsylvania/">Pittsburgh</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children">
            <a href="https://www.techelevator.com/coding-bootcamp/">Bootcamp Info</a>
            <ul class="sub-menu">
                <li class="menu-item menu-item-type-post_type menu-item-object-page">
                    <a href="https://www.techelevator.com/coding-bootcamp/faqs/">FAQs</a>
                </li>
            </ul>
        </li>

        <div class="footer-disclaimer">
            <p>
                Tech Elevator is licensed under the Delaware Department of Education, Michigan Department of Licensing and
                Regulatory Affairs, Ohio State Board of Career Colleges and Schools, Pennsylvania State Board of Private
                Licensed Schools and Texas Workforce Commission. |
                Cincinnati Certificate No. 2114 | Cleveland Certificate No. 2072 | Columbus Certificate No. 2090 | Dallas
                Certificate No S5796 |
                Pittsburgh AUN No. 402029219 | Detroit License No. 8604001265 | Philadelphia AUN No: 426515169 | Wilmington
                license issued August 16, 2022
            </p>
        </div>
    </footer>
</template>
<style scoped>
.footer {
    margin-top: 20px;
    background-color: #F8FCFE;
    padding: 20px;
    border: 1px solid #CCC;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);

}

#social-icons {
    display: flex;
    justify-content: center;
    align-items: center;
    list-style: none;
    padding: 0;
    margin: 0;
}

#social-icons li {
    margin-right: 10px;
}

#social-icons li:last-child {
    margin-right: 0;
}

#social-icons li a {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 60px;
    height: 60px;
    border-radius: 50%;
    transition: background-color 0.3s ease-in-out;
}

#social-icons li a img {
    width: 50px;
    height: 50px;
}



/* Contact Info styles */
.contact-info {
    display: flex;
    justify-content: space-around;
}

.contact-info div {
    flex: 1;
    text-align: center;
}

/* Menu styles */
.menu {
    list-style: none;
    padding: 0;
    margin: 0;
}

.menu-item {
    display: inline-block;
    margin-right: 10px;
}

.menu-item a {
    text-decoration: none;
    color: #333;
    padding: 5px;
    transition: color 0.3s ease-in-out;
}

.menu-item a:hover {
    color: #007BFF;
}

.sub-menu {
    display: none;
    position: absolute;
    background-color: #F8FCFE;
    padding: 10px;
    border: 1px solid #CCC;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.menu-item:hover .sub-menu {
    display: block;
}

.sub-menu li {
    margin-bottom: 5px;
}

.sub-menu li a {
    display: block;
    padding: 5px;
    color: #333;
    text-decoration: none;
    transition: color 0.3s ease-in-out;
}

.sub-menu li a:hover {
    color: #007BFF;
}

/* Footer Disclaimer styles */
.footer-disclaimer {
    margin-top: 20px;
    text-align: center;
    color: #888;
    font-size: 14px;
}
</style>