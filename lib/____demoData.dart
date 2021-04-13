class Demo{
  static final users = <User>[
    User(name: 'Karim Zaman', phone: '01591-696 545', image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    User(name: 'Sofia Karim', phone: '01674-698 325', image: 'https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    User(name: 'Abbas Hossain', phone: '01234-698 741', image: 'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    User(name: 'Yashfi Islam', phone: '01691-654 123', image: 'https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    User(name: 'Karim Zaman', phone: '01591-696 545', image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    User(name: 'Sofia Karim', phone: '01674-698 325', image: 'https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    User(name: 'Abbas Hossain', phone: '01234-698 741', image: 'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    User(name: 'Yashfi Islam', phone: '01234-852 369', image: 'https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    User(name: 'Karim Zaman', phone: '01591-696 545', image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    User(name: 'Sofia Karim', phone: '01674-698 325', image: 'https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
    User(name: 'Abbas Hossain', phone: '01234-698 741', image: 'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    User(name: 'Yashfi Islam', phone: '03147-875 142', image: 'https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
  ];
  static final profilePic = 'https://images.unsplash.com/photo-1541855492-581f618f69a0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
  static final qrCode = 'https://i.ibb.co/g9CxVy1/qr-code.png';
  static final clubLogo = 'https://i.ibb.co/gZjtSnx/offlogoo.png';
  static final hallLogo = 'https://cdn1.iconfinder.com/data/icons/buildings-95/130/24-512.png';
  static final poolLogo = 'https://cdn.iconscout.com/icon/premium/png-256-thumb/swimming-pool-2923421-2432935.png';
  static final cafeteriaLogo = 'https://i.pinimg.com/originals/cd/a9/7c/cda97c2ed39900207b1915a38116b373.png';
  static final salonLogo = 'https://cdn.iconscout.com/icon/premium/png-512-thumb/salon-logo-462569.png';
  static final nagadLogo = 'https://feegleejobs.com/wp-content/uploads/2019/11/NAGAD-LOGO.png';
  static final bKashLogo = 'https://marketplace.whmcs.com/product/5665/images/icon200-e9b099db9cab8c18b73c4ea121df6ff0.png';
  static final visaLogo = 'https://media-eng.dhakatribune.com/uploads/2021/02/visa-credit-card-logo-512-1613502609560.png';
  static final couponLogo = 'https://image.flaticon.com/icons/png/512/1350/1350762.png';
  static final guestLogo = 'https://roomassistant.com/wp-content/themes/roomassistant_v2/dist/images/guest_vector.png';
  static final libraryLogo = 'https://princh.com/wp-content/uploads/2020/06/blog-banner3-1024x831.png';
  static final laundryLogo = 'https://image.flaticon.com/icons/png/512/3929/3929094.png';
  static final blogImages = [
    'https://neilpatel.com/wp-content/uploads/2020/10/how-to-start-a-blog-featured-image.jpg',
    'https://dvyvvujm9h0uq.cloudfront.net/com/articles/1516553760-shutterstock-429631015.jpg',
    'https://www.wpbeginner.com/wp-content/uploads/2018/07/whatisblog.png',
    'https://www.start-business-online.com/images/article_manager_uploads/blog.jpg',
  ];
  static final blogImages2 = [
    'https://www.start-business-online.com/images/article_manager_uploads/blog.jpg',
    'https://www.wpbeginner.com/wp-content/uploads/2018/07/whatisblog.png',
    'https://dvyvvujm9h0uq.cloudfront.net/com/articles/1516553760-shutterstock-429631015.jpg',
    'https://neilpatel.com/wp-content/uploads/2020/10/how-to-start-a-blog-featured-image.jpg',
  ];
}


class User{
  String name;
  String phone;
  String image;

  User({this.name, this.phone, this.image});
}