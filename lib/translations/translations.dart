import 'package:i18n_extension/i18n_extension.dart';

const loginEmail = "loginEmail";
const loginSenha = "loginSenha";
const loginSenhaConfirm = "loginSenhaConfirm";
const loginEntrar = "loginEntrar";
const loginCreateAccount = "loginCreateAccount";
const accountCreated = "accountCreated";
const userDisabled = "userDisabled";
const accountAlreadyExists = "accountAlreadyExists";
const verifyEmail = "verifyEmail";
const loginSendEmailResetPassword = "loginSendEmailResetPassword";
const textEmailReset = "textEmailReset";
const loginEntrarGoogle = "loginEntrarGoogle";
const loginCadastrar = "loginCadastrar";
const recuperarSenha = "recuperarSenha";
const loginCanceled = "loginCanceled";
const emailSent = "emailSent";
const serverError = "serverError";
const accountGoogleExistsWithDifferentCredentials =
    "accountGoogleExistsWithDifferentCredentials";
const accountGoogleWrongCredentials = "accountGoogleWrongCredentials";
const googleSignInError = "googleSignInError";
const signOutError = "signOutError";
const signOutLabel = "signOutLabel";
const userNotFound = "userNotFound";
const wrongPassword = "wrongPassword";
const loginError = "loginError";
const firebaseInitializingError = "firebaseInitializingError";
const flutterError = "flutterError";
const fieldFilled = "fieldFilled";
const emailIsValid = "emailIsValid";
const passwordIsValid = "passwordIsValid";
const passwordConfirmError = "passwordConfirmError";
const firebaseTooManyRequests = "firebaseTooManyRequests";
const movieLabel = "movieLabel";
const serieLabel = "serieLabel";
const hello = "hello";
const changeLanguage = "changeLanguage";
const titleChangeLanguage = "titleChangeLanguage";
const languageChanged = "languageChanged";
const joinWithUs = "joinWithUs";
const comeBackToUs = "comeBackToUs";
const signOutTitle = "signOutTitle";
const signOutMessage = "signOutMessage";
const signOutYes = "signOutYes";
const signOutNo = "signOutNo";
const catalogoMoviesTrendingDay = "catalogoMoviesTrendingDay";
const catalogoMoviesTrendingWeek = "catalogoMoviesTrendingWeek";
const catalogoMoviesPopular = "catalogoMoviesPopular";
const catalogoSeriesTrendingDay = "catalogoSeriesTrendingDay";
const catalogoSeriesTrendingWeek = "catalogoSeriesTrendingWeek";
const catalogoSeriesPopular = "catalogoSeriesPopular";
const catalogoMoviesAction = "catalogoMoviesAction";
const catalogoMoviesAdventure = "catalogoMoviesAdventure";
const catalogoMoviesAnimation = "catalogoMoviesAnimation";
const catalogoMoviesComedy = "catalogoMoviesComedy";
const catalogoMoviesCrime = "catalogoMoviesCrime";
const catalogoMoviesDocumentary = "catalogoMoviesDocumentary";
const catalogoMoviesDrama = "catalogoMoviesDrama";
const catalogoMoviesFamily = "catalogoMoviesFamily";
const catalogoMoviesFantasy = "catalogoMoviesFantasy";
const catalogoMoviesHistory = "catalogoMoviesHistory";
const catalogoMoviesHorror = "catalogoMoviesHorror";
const catalogoMoviesMusic = "catalogoMoviesMusic";
const catalogoMoviesMystery = "catalogoMoviesMystery";
const catalogoMoviesRomance = "catalogoMoviesRomance";
const catalogoMoviesScienceFiction = "catalogoMoviesScienceFiction";
const catalogoMoviesTvMovie = "catalogoMoviesTvMovie";
const catalogoMoviesThiller = "catalogoMoviesThiller";
const catalogoMoviesWar = "catalogoMoviesWar";
const catalogoMoviesWestern = "catalogoMoviesWestern";
const catalogoSerieActionAdventure = "catalogoSerieActionAdventure";
const catalogoSerieKids = "catalogoSerieKids";
const catalogoSerieNews = "catalogoSerieNews";
const catalogoSerieReality = "catalogoSerieReality";
const catalogoSerieSoap = "catalogoSerieSoap";
const catalogoSerieTalk = "catalogoSerieTalk";
const searchHere = "searchHere";
const contentNotFound = "contentNotFound";
const popularity = "popularity";
const voteCount = "voteCount";
const withoutOverview = "withoutOverview";
const videoLabel = "videoLabel";
const episodioCount = "episodioCount";
const planLabel = "planLabel";
const choosePlan = "choosePlan";
const videoQuality = "videoQuality";
const good = "good";
const better = "better";
const best = "best";
const resolution = "resolution";
const screens = "screens";
const one = "one";
const two = "two";
const threeFive = "threeFive";
const monthly = "monthly";
const basic = "basic";
const basicPrice = "basicPrice";
const standard = "standard";
const standardPrice = "standardPrice";
const bestPrice = "bestPrice";
const continueLabel = "continueLabel";
const moneyCode = "moneyCode";
const cardNumber = "cardNumber";
const cardName = "cardName";
const cardExpiryDate = "cardExpiryDate";
const cardCVC = "cardCVC";
const debit = "debit";
const credit = "credit";
const price = "price";
const payment = "payment";
const cardNumberValid = "cardNumberValid";
const cardExpiryDateValid = "cardExpiryDateValid";
const cardCVCValid = "cardCVCValid";
const pay = "pay";
const paymentSucceeded = "paymentSucceeded";
const paymentCancelOrChange = "paymentCancelOrChange";
const yourPlan = "yourPlan";
const paymentMethod = "paymentMethod";
const alterPlan = "alterPlan";
const cancelPlan = "cancelPlan";
const alterCard = "alterCard";
const save = "save";
const paymentMethodChanged = "paymentMethodChanged";
const cancelTitle = "cancelTitle";
const cancelMessage = "cancelMessage";
const cancelPlanNo = "cancelPlanNo";
const cancelPlanYes = "cancelPlanYes";
const planCanceled = "planCanceled";
const planChangedTitle = "planChangedTitle";
const planChangedMessage = "planChangedMessage";
const signForFullContent = "signForFullContent";

extension Localization on String {
  static final _t = Translations.from(null, {
    loginEmail: {
      "en_us": "E-Mail:",
      "pt_br": "Email:",
    },
    loginSenha: {
      "en_us": "Password:",
      "pt_br": "Senha:",
    },
    loginSenhaConfirm: {
      "en_us": "Confirm Password:",
      "pt_br": "Confirme a senha:",
    },
    loginEntrar: {
      "en_us": "Sign in",
      "pt_br": "Entrar",
    },
    loginCreateAccount: {
      "en_us": "Create account",
      "pt_br": "Criar conta",
    },
    accountCreated: {
      "en_us": "Account created, please verify your e-mail",
      "pt_br": "Conta criada, por favor verifique seu email",
    },
    verifyEmail: {
      "en_us": "Please verify your e-mail",
      "pt_br": "Por favor verifique seu email",
    },
    loginEntrarGoogle: {
      "en_us": "Sign in with Google",
      "pt_br": "Entrar com Google",
    },
    loginCadastrar: {
      "en_us": "Sign up",
      "pt_br": "Cadastre-se",
    },
    recuperarSenha: {
      "en_us": "Forgot your password?",
      "pt_br": "Esqueceu sua Senha?",
    },
    loginSendEmailResetPassword: {
      "en_us": "Send E-Mail",
      "pt_br": "Enviar email",
    },
    loginCanceled: {
      "en_us": "Login canceled",
      "pt_br": "Login cancelado",
    },
    textEmailReset: {
      "en_us": "We will send an E-Mail to you reset your password",
      "pt_br": "Enviaremos um email para você redefinir sua senha",
    },
    emailSent: {
      "en_us": "E-Mail sent",
      "pt_br": "Email enviado",
    },
    serverError: {
      "en_us": "Failed to connect to the server. Try again later.",
      "pt_br": "Falha ao conectar no servidor. Tente novamente mais tarde.",
    },
    accountGoogleExistsWithDifferentCredentials: {
      "en_us": "The account already exists with a different credential",
      "pt_br": "Essa conta existe com credenciais diferentes",
    },
    accountGoogleWrongCredentials: {
      "en_us": "Error occurred while accessing credentials. Try again.",
      "pt_br": "Ocorreu um erro ao acessar as credenciais, Tente novamente",
    },
    googleSignInError: {
      "en_us": "Error occurred using Google Sign In. Try again",
      "pt_br": "Ocorreu um erro ao logar com o Google, Tente novamente",
    },
    signOutError: {
      "en_us": "Error signing out. Try again.",
      "pt_br": "Ocorreu um erro ao deslogar. Tente novamente",
    },
    signOutLabel: {
      "en_us": "Sign out",
      "pt_br": "Sair",
    },
    userNotFound: {
      "en_us": "User not found",
      "pt_br": "Usuário não encontrado",
    },
    wrongPassword: {
      "en_us": "Incorrect Password",
      "pt_br": "Senha incorreta",
    },
    loginError: {
      "en_us": "Error occurred while log in. Try again",
      "pt_br": "Ocorreu um erro ao logar. Tente novamente",
    },
    firebaseInitializingError: {
      "en_us": "Error initializing Firebase",
      "pt_br": "Erro ao inicializar o Firebase",
    },
    flutterError: {
      "en_us": "Internal application Error",
      "pt_br": "Ocorreu um erro interno do aplicativo",
    },
    fieldFilled: {
      "en_us": "The field must have a value",
      "pt_br": "Campo obrigatório",
    },
    emailIsValid: {
      "en_us": "Enter with a valid E-Mail",
      "pt_br": "Preencha com um email válido",
    },
    passwordIsValid: {
      "en_us": "The field must have at least 6 characters long",
      "pt_br": "O campo deve ter no mínimo 6 caracteres",
    },
    passwordConfirmError: {
      "en_us": "The passwords must be equals",
      "pt_br": "As senhas devem ser iguais",
    },
    userDisabled: {
      "en_us": "User disabled",
      "pt_br": "Usuário desativado",
    },
    accountAlreadyExists: {
      "en_us": "Account already exists with this e-mail",
      "pt_br": "Já existe uma conta com esse email",
    },
    firebaseTooManyRequests: {
      "en_us": "We got some troubles. Try again later",
      "pt_br": "Estamos com problemas. Tente novamente mais tarde",
    },
    movieLabel: {
      "en_us": "Movies",
      "pt_br": "Filmes",
    },
    serieLabel: {
      "en_us": "Series",
      "pt_br": "Séries",
    },
    hello: {
      "en_us": "HELLO",
      "pt_br": "OLÁ",
    },
    changeLanguage: {
      "en_us": "LANGUAGE",
      "pt_br": "IDIOMA",
    },
    titleChangeLanguage: {
      "en_us": "Choose the language",
      "pt_br": "Escolha o idioma",
    },
    languageChanged: {
      "en_us": "Language changed to Portugese",
      "pt_br": "Idioma alterado para Inglês",
    },
    joinWithUs: {
      "en_us": "Join with us",
      "pt_br": "Junte-se conosco",
    },
    comeBackToUs: {
      "en_us": "Come back to us",
      "pt_br": "Volte para a gente",
    },
    signOutTitle: {
      "en_us": "Are you sure?",
      "pt_br": "Você tem certeza?",
    },
    signOutMessage: {
      "en_us": "Stay with us a little bit more =(",
      "pt_br": "Fique com a gente mais um pouquinho =(",
    },
    signOutYes: {
      "en_us": "Sign Out",
      "pt_br": "Sair",
    },
    signOutNo: {
      "en_us": "Cancel",
      "pt_br": "Cancelar",
    },
    catalogoMoviesTrendingDay: {
      "en_us": "Trending movies of the day",
      "pt_br": "Filmes em alta no dia",
    },
    catalogoMoviesTrendingWeek: {
      "en_us": "Trending movies of the week",
      "pt_br": "Filmes em alta na semana",
    },
    catalogoMoviesPopular: {
      "en_us": "Popular movies",
      "pt_br": "Filmes populares",
    },
    catalogoSeriesTrendingDay: {
      "en_us": "Trending series of the day",
      "pt_br": "Séries em alta no dia",
    },
    catalogoSeriesTrendingWeek: {
      "en_us": "Trending series of the week",
      "pt_br": "Séries em alta na semana",
    },
    catalogoSeriesPopular: {
      "en_us": "Popular series",
      "pt_br": "Séries populares",
    },
    catalogoMoviesAction: {
      "en_us": "Action",
      "pt_br": "Ação",
    },
    catalogoMoviesAdventure: {
      "en_us": "Adventure",
      "pt_br": "Aventura",
    },
    catalogoMoviesAnimation: {
      "en_us": "Animations",
      "pt_br": "Animações",
    },
    catalogoMoviesComedy: {
      "en_us": "Comedy",
      "pt_br": "Comédia",
    },
    catalogoMoviesCrime: {
      "en_us": "Crime",
      "pt_br": "Crime",
    },
    catalogoMoviesDocumentary: {
      "en_us": "Documentary",
      "pt_br": "Documentário",
    },
    catalogoMoviesDrama: {
      "en_us": "Drama",
      "pt_br": "Drama",
    },
    catalogoMoviesFamily: {
      "en_us": "Family",
      "pt_br": "Família",
    },
    catalogoMoviesFantasy: {
      "en_us": "Fantasy",
      "pt_br": "Fantasia",
    },
    catalogoMoviesHistory: {
      "en_us": "History",
      "pt_br": "History",
    },
    catalogoMoviesHorror: {
      "en_us": "Horror",
      "pt_br": "Horror",
    },
    catalogoMoviesMusic: {
      "en_us": "Musical",
      "pt_br": "Musical",
    },
    catalogoMoviesMystery: {
      "en_us": "Mystery",
      "pt_br": "Mistério",
    },
    catalogoMoviesRomance: {
      "en_us": "Romance",
      "pt_br": "Romance",
    },
    catalogoMoviesScienceFiction: {
      "en_us": "Science Fiction",
      "pt_br": "Ficção Científica",
    },
    catalogoMoviesTvMovie: {
      "en_us": "TV Movies",
      "pt_br": "Filmes de TV",
    },
    catalogoMoviesThiller: {
      "en_us": "Thriller",
      "pt_br": "Suspense",
    },
    catalogoMoviesWar: {
      "en_us": "War",
      "pt_br": "Guerra",
    },
    catalogoMoviesWestern: {
      "en_us": "Western",
      "pt_br": "Faroeste",
    },
    catalogoSerieActionAdventure: {
      "en_us": "Action & Adventure",
      "pt_br": "Ação & Aventura",
    },
    catalogoSerieKids: {
      "en_us": "For kids",
      "pt_br": "Para crianças",
    },
    catalogoSerieNews: {
      "en_us": "News",
      "pt_br": "Noticiários",
    },
    catalogoSerieReality: {
      "en_us": "Reality",
      "pt_br": "Realidade",
    },
    catalogoSerieSoap: {
      "en_us": "Soap Opera",
      "pt_br": "Novela",
    },
    catalogoSerieTalk: {
      "en_us": "Talk",
      "pt_br": "Conversação",
    },
    searchHere: {
      "en_us": "Search movies and series",
      "pt_br": "Busque por filmes e séries",
    },
    contentNotFound: {
      "en_us": "We didn't find anything",
      "pt_br": "Não encontramos nada",
    },
    popularity: {
      "en_us": "Popularity",
      "pt_br": "Popularidade",
    },
    voteCount: {
      "en_us": "Likes",
      "pt_br": "Curtidas",
    },
    withoutOverview: {
      "en_us": "No overview found",
      "pt_br": "Nenhuma descrição encontrada",
    },
    videoLabel: {
      "en_us": "Videos",
      "pt_br": "Vídeos",
    },
    episodioCount: {
      "en_us": "Episodes count: ",
      "pt_br": "Quantidade de Episódios: ",
    },
    planLabel: {
      "en_us": "Plans",
      "pt_br": "Planos",
    },
    choosePlan: {
      "en_us": "Choose your plan",
      "pt_br": "Escolha seu plano",
    },
    videoQuality: {
      "en_us": "Video Quality: ",
      "pt_br": "Qualidade do vídeo: ",
    },
    good: {
      "en_us": "Good",
      "pt_br": "Normal",
    },
    better: {
      "en_us": "Better",
      "pt_br": "Boa",
    },
    best: {
      "en_us": "Best",
      "pt_br": "Melhor",
    },
    resolution: {
      "en_us": "Resolution: ",
      "pt_br": "Resolução: ",
    },
    screens: {
      "en_us": "Screens: ",
      "pt_br": "Telas: ",
    },
    one: {
      "en_us": "One",
      "pt_br": "Uma",
    },
    two: {
      "en_us": "Two",
      "pt_br": "Duas",
    },
    threeFive: {
      "en_us": "Three to Five",
      "pt_br": "Três à Cinco",
    },
    monthly: {
      "en_us": "Monthly",
      "pt_br": "Mensal",
    },
    basic: {
      "en_us": "Basic",
      "pt_br": "Básico",
    },
    basicPrice: {
      "en_us": "8,00",
      "pt_br": "19,00",
    },
    standard: {
      "en_us": "Standard",
      "pt_br": "Padrão",
    },
    standardPrice: {
      "en_us": "15,00",
      "pt_br": "25,90",
    },
    bestPrice: {
      "en_us": "21,00",
      "pt_br": "45,00",
    },
    continueLabel: {
      "en_us": "Continue",
      "pt_br": "Continuar",
    },
    moneyCode: {
      "en_us": "USD ",
      "pt_br": "R\$ ",
    },
    cardNumber: {
      "en_us": "Card Number",
      "pt_br": "Número do Cartão",
    },
    cardName: {
      "en_us": "Name",
      "pt_br": "Nome",
    },
    cardExpiryDate: {
      "en_us": "Expiry Date",
      "pt_br": "Data de Validade",
    },
    cardCVC: {
      "en_us": "CVC",
      "pt_br": "CVC",
    },
    debit: {
      "en_us": "Debit",
      "pt_br": "Débito",
    },
    credit: {
      "en_us": "Credit",
      "pt_br": "Crédito",
    },
    price: {
      "en_us": "Price",
      "pt_br": "Preço",
    },
    payment: {
      "en_us": "Payment",
      "pt_br": "Pagamento",
    },
    cardNumberValid: {
      "en_us": "Fill with a valid card number",
      "pt_br": "Preencha com um número de cartão válido",
    },
    cardExpiryDateValid: {
      "en_us": "Fill with a valid date",
      "pt_br": "Data não é válida",
    },
    cardCVCValid: {
      "en_us": "Fill with a valid CVC",
      "pt_br": "CVC não é válido",
    },
    pay: {
      "en_us": "Pay",
      "pt_br": "Pagar",
    },
    paymentSucceeded: {
      "en_us": "Payment succeeded",
      "pt_br": "Pagamento realizado",
    },
    paymentCancelOrChange: {
      "en_us": "Cancel or change the plan anytime ;)",
      "pt_br": "Cancele ou mude de plano a qualquer hora ;)",
    },
    yourPlan: {
      "en_us": "Your plan",
      "pt_br": "Seu plano",
    },
    paymentMethod: {
      "en_us": "Payment\nmethod",
      "pt_br": "Método de\npagamento",
    },
    alterPlan: {
      "en_us": "Alter\nplan",
      "pt_br": "Alterar\nplano",
    },
    cancelPlan: {
      "en_us": "Cancel\nplan",
      "pt_br": "Cancelar\nplano",
    },
    alterCard: {
      "en_us": "Set new card",
      "pt_br": "Alterar dados",
    },
    save: {
      "en_us": "Save",
      "pt_br": "Salvar",
    },
    paymentMethodChanged: {
      "en_us": "Payment method changed",
      "pt_br": "Método de pagamento alterado",
    },
    cancelTitle: {
      "en_us": "Cancel plan",
      "pt_br": "Cancelar plano",
    },
    cancelMessage: {
      "en_us":
          "Are you sure? :(\nYou will not have access to complete movies and series anymore",
      "pt_br":
          "Tem certeza? :(\nVocê não terá mais acesso aos filmes e séries completos",
    },
    cancelPlanNo: {
      "en_us": "No",
      "pt_br": "Não",
    },
    cancelPlanYes: {
      "en_us": "Yes, cancel",
      "pt_br": "Sim, cancelar",
    },
    planCanceled: {
      "en_us": "Plan canceled",
      "pt_br": "Plano cancelado",
    },
    planChangedTitle: {
      "en_us": "Plan changed",
      "pt_br": "Plano alterado",
    },
    planChangedMessage: {
      "en_us": "The new price will be charged in your next bill ;)",
      "pt_br": "O novo preço será cobrado na sua próxima fatura ;)",
    },
    signForFullContent: {
      "en_us":
          "Choose one plan to have complete access in our movies and series",
      "pt_br":
          "Escolha uma plano para ter acesso completo nos nossos filmes e séries",
    },
  });

  String getStringLanguage(String languageCode) {
    return localize(this, _t, locale: languageCode);
  }
}
