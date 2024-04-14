


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>FAQs</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="components/common_css_js.jsp" %>
    <style>
        
        .faq-question {
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            margin: 10px 0;
            padding: 10px;
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            border-radius: 3px;
            transition: background-color 0.2s ease-in-out;
        }

        .faq-question:hover {
            background-color: #ddd;
        }

        .faq-answer {
            display: none;
            margin: 10px 0;
            padding: 10px;
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            border-radius: 3px;
           
        }

        

        .faq-answer.show {
            display: block;
           
        }

        h1 {
  font-size: 36px;
  font-weight: bold;
  margin-top: 50px;
  margin-bottom: 30px;
  text-transform: uppercase;
  letter-spacing: 2px;
  color: #333;
}

    </style>
</head>

<body>
    <%@include file="components/navbar.jsp" %>
    <header>
        <h1>Frequently Asked Questions</h1>
    </header>
    <section class="faq-section">
        <div class="faq-container">
            <div class="faq-question" onclick="toggleAnswer(this)">
            How secure is my online purchase?
            </div>
            <div class="faq-answer">
                <p>We take the security of your online purchases very seriously. Our website is equipped with the latest SSL encryption
                technology to ensure your personal and payment information is protected..</p>
            </div>
        </div>
        <div class="faq-container">
            <div class="faq-question" onclick="toggleAnswer(this)">
                How do I set up an online store?
            </div>
            <div class="faq-answer">
                <ul>
                    <li>You can set up an online store by choosing an e-commerce platform, designing your website, and adding your products.
                    You'll also need to set up payment and shipping options.</li>
                   
                </ul>
            </div>
        </div>
        <div class="faq-container">
            <div class="faq-question" onclick="toggleAnswer(this)">
                What platform should I use for my e-commerce business?
            </div>
            <div class="faq-answer">
                <p>There are many e-commerce platforms to choose from, including Shopify, WooCommerce, and Magento. Consider your business
                needs and budget when choosing a platform.</p>
            </div>
        </div>
        <div class="faq-container">
            <div class="faq-question" onclick="toggleAnswer(this)">
                How can I increase my online sales?
            </div>
            <div class="faq-answer">
                <p>You can increase online sales by improving your website's design and user experience, offering promotions and discounts,
                and engaging with customers on social media.</p>
            </div>
        </div>
        <div class="faq-container">
            <div class="faq-question" onclick="toggleAnswer(this)">
            What is your return policy?
            </div>
            <div class="faq-answer">
                <p>We accept returns for most items within 30 days of delivery. The item must be in its original condition and packaging,
                and you must provide proof of purchase. Some items, such as personalized or custom-made products, may not be eligible
                for return. Please see our full return policy for more details.</p>
            </div>
        </div>



    </section>
   
    <script>
        function toggleAnswer(question) {
            var answer = question.nextElementSibling;
            var isActive = question.classList.contains('active');
            var questions = document.querySelectorAll('.faq-question');

            for (var i = 0; i < questions.length; i++) {
                questions[i].classList.remove('active');
                questions[i].nextElementSibling.classList.remove('show');
                        }

                       

                        if (!isActive) {
                            question.classList.add('active');
                            answer.classList.add('show');
                        }
                    }
                </script>
</body>
</html>