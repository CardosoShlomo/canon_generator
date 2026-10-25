// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'mega.dart';

// **************************************************************************
// NavGenerator
// **************************************************************************

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: annotate_overrides
Object? _idOf(Enum s) {
  for (final e in _Screens.graph.stack.reversed) {
    if (e.screen == s) return e.id;
  }
  return null;
}

bool _chainIs(List<Enum> a, List<Enum> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

final class const Screen<I>._(final Enum _spec) {
  /// This screen's name, as written in the grammar enum — the
  /// readable identity of a stack entry (`Screen.stack.current.name`).
  String get name => _spec.name;
  static const splash = Screen<Never>._(_Screens.splash);
  static const signIn = Screen<Never>._(_Screens.signIn);
  static const signUp = Screen<Never>._(_Screens.signUp);
  static const onboarding = Screen<Never>._(_Screens.onboarding);
  static const forgotPassword = Screen<Never>._(_Screens.forgotPassword);
  static const resetPassword = Screen<String>._(_Screens.resetPassword);
  static const verifyEmail = Screen<Never>._(_Screens.verifyEmail);
  static const twoFactor = Screen<Never>._(_Screens.twoFactor);
  static const home = Screen<Never>._(_Screens.home);
  static const feed = Screen<Never>._(_Screens.feed);
  static const composePost = Screen<Never>._(_Screens.composePost);
  static const story = Screen<String>._(_Screens.story);
  static const post = Screen<String>._(_Screens.post);
  static const comment = Screen<String>._(_Screens.comment);
  static const postAuthor = Screen<String>._(_Screens.postAuthor);
  static const postComments = Screen<String>._(_Screens.postComments);
  static const postLikes = Screen<String>._(_Screens.postLikes);
  static const editPost = Screen<String>._(_Screens.editPost);
  static const repost = Screen<String>._(_Screens.repost);
  static const discover = Screen<Never>._(_Screens.discover);
  static const trending = Screen<Never>._(_Screens.trending);
  static const topics = Screen<Never>._(_Screens.topics);
  static const topic = Screen<String>._(_Screens.topic);
  static const subtopic = Screen<String>._(_Screens.subtopic);
  static const hashtag = Screen<String>._(_Screens.hashtag);
  static const liveNow = Screen<Never>._(_Screens.liveNow);
  static const liveRoom = Screen<String>._(_Screens.liveRoom);
  static const nearby = Screen<Never>._(_Screens.nearby);
  static const marketplace = Screen<Never>._(_Screens.marketplace);
  static const categories = Screen<Never>._(_Screens.categories);
  static const category = Screen<String>._(_Screens.category);
  static const listing = Screen<String>._(_Screens.listing);
  static const listingVariant = Screen<String>._(_Screens.listingVariant);
  static const editListing = Screen<String>._(_Screens.editListing);
  static const sellerProfile = Screen<String>._(_Screens.sellerProfile);
  static const cart = Screen<Never>._(_Screens.cart);
  static const checkout = Screen<String>._(_Screens.checkout);
  static const orderConfirmation = Screen<String>._(_Screens.orderConfirmation);
  static const myOrders = Screen<Never>._(_Screens.myOrders);
  static const order = Screen<String>._(_Screens.order);
  static const wishlist = Screen<Never>._(_Screens.wishlist);
  static const messages = Screen<Never>._(_Screens.messages);
  static const chats = Screen<Never>._(_Screens.chats);
  static const chat = Screen<String>._(_Screens.chat);
  static const thread = Screen<String>._(_Screens.thread);
  static const message = Screen<String>._(_Screens.message);
  static const messageReply = Screen<String>._(_Screens.messageReply);
  static const voiceCall = Screen<String>._(_Screens.voiceCall);
  static const newChat = Screen<Never>._(_Screens.newChat);
  static const groupChat = Screen<String>._(_Screens.groupChat);
  static const groupInfo = Screen<String>._(_Screens.groupInfo);
  static const wallet = Screen<Never>._(_Screens.wallet);
  static const balance = Screen<Never>._(_Screens.balance);
  static const accounts = Screen<Never>._(_Screens.accounts);
  static const account = Screen<String>._(_Screens.account);
  static const transactions = Screen<Never>._(_Screens.transactions);
  static const transaction = Screen<String>._(_Screens.transaction);
  static const transactionItem = Screen<String>._(_Screens.transactionItem);
  static const sendMoney = Screen<Never>._(_Screens.sendMoney);
  static const receiveMoney = Screen<Never>._(_Screens.receiveMoney);
  static const paymentMethods = Screen<Never>._(_Screens.paymentMethods);
  static const addCard = Screen<Never>._(_Screens.addCard);
  static const card = Screen<String>._(_Screens.card);
  static const statements = Screen<Never>._(_Screens.statements);
  static const statement = Screen<String>._(_Screens.statement);
  static const profile = Screen<Never>._(_Screens.profile);
  static const userProfile = Screen<String>._(_Screens.userProfile);
  static const followers = Screen<String>._(_Screens.followers);
  static const following = Screen<String>._(_Screens.following);
  static const connection = Screen<String>._(_Screens.connection);
  static const mutualConnections = Screen<Never>._(_Screens.mutualConnections);
  static const editProfile = Screen<Never>._(_Screens.editProfile);
  static const achievements = Screen<Never>._(_Screens.achievements);
  static const badges = Screen<Never>._(_Screens.badges);
  static const badge = Screen<String>._(_Screens.badge);
  static const savedPosts = Screen<Never>._(_Screens.savedPosts);
  static const drafts = Screen<Never>._(_Screens.drafts);
  static const myListings = Screen<Never>._(_Screens.myListings);
  static const notifications = Screen<Never>._(_Screens.notifications);
  static const notificationSettings = Screen<Never>._(
    _Screens.notificationSettings,
  );
  static const search = Screen<Never>._(_Screens.search);
  static const searchResults = Screen<Never>._(_Screens.searchResults);
  static const settings = Screen<Never>._(_Screens.settings);
  static const accountSettings = Screen<Never>._(_Screens.accountSettings);
  static const security = Screen<Never>._(_Screens.security);
  static const twoFactorSettings = Screen<Never>._(_Screens.twoFactorSettings);
  static const privacy = Screen<Never>._(_Screens.privacy);
  static const appearance = Screen<Never>._(_Screens.appearance);
  static const language = Screen<Never>._(_Screens.language);
  static const connectedApps = Screen<Never>._(_Screens.connectedApps);
  static const about = Screen<Never>._(_Screens.about);
  static const help = Screen<Never>._(_Screens.help);
  static const helpCategory = Screen<String>._(_Screens.helpCategory);
  static const faq = Screen<Never>._(_Screens.faq);
  static const faqArticle = Screen<String>._(_Screens.faqArticle);
  static const feedback = Screen<Never>._(_Screens.feedback);
  static const blockedUsers = Screen<Never>._(_Screens.blockedUsers);
  static const devices = Screen<Never>._(_Screens.devices);
  static const device = Screen<String>._(_Screens.device);
  static const sessions = Screen<Never>._(_Screens.sessions);
  static const session = Screen<String>._(_Screens.session);
  static const dataExport = Screen<Never>._(_Screens.dataExport);
  static const deleteAccount = Screen<Never>._(_Screens.deleteAccount);
  static const workspace = Screen<Never>._(_Screens.workspace);
  static const project = Screen<String>._(_Screens.project);
  static const board = Screen<String>._(_Screens.board);
  static const taskList = Screen<String>._(_Screens.taskList);
  static const task = Screen<String>._(_Screens.task);
  static const subtask = Screen<String>._(_Screens.subtask);
  static const checklistItem = Screen<String>._(_Screens.checklistItem);
  static const editTask = Screen<String>._(_Screens.editTask);
  static const taskComment = Screen<String>._(_Screens.taskComment);
  static const assignee = Screen<String>._(_Screens.assignee);
  static const label = Screen<String>._(_Screens.label);
  static const milestone = Screen<String>._(_Screens.milestone);
  static const sprint = Screen<String>._(_Screens.sprint);
  static const forum = Screen<Never>._(_Screens.forum);
  static const forumCategory = Screen<String>._(_Screens.forumCategory);
  static const forumThread = Screen<String>._(_Screens.forumThread);
  static const forumReply = Screen<String>._(_Screens.forumReply);
  static const reportThread = Screen<String>._(_Screens.reportThread);
  static const learn = Screen<Never>._(_Screens.learn);
  static const course = Screen<String>._(_Screens.course);
  static const courseModule = Screen<String>._(_Screens.courseModule);
  static const lesson = Screen<String>._(_Screens.lesson);
  static const quiz = Screen<String>._(_Screens.quiz);
  static const question = Screen<String>._(_Screens.question);
  static const answer = Screen<String>._(_Screens.answer);
  static const courseReview = Screen<String>._(_Screens.courseReview);
  static const instructor = Screen<String>._(_Screens.instructor);
  static const certificate = Screen<String>._(_Screens.certificate);
  static const shop = Screen<Never>._(_Screens.shop);
  static const shopDept = Screen<String>._(_Screens.shopDept);
  static const shopCategory = Screen<String>._(_Screens.shopCategory);
  static const shopSubcategory = Screen<String>._(_Screens.shopSubcategory);
  static const product = Screen<String>._(_Screens.product);
  static const productVariant = Screen<String>._(_Screens.productVariant);
  static const productReview = Screen<String>._(_Screens.productReview);
  static const brand = Screen<String>._(_Screens.brand);
  static const compareProducts = Screen<Never>._(_Screens.compareProducts);
  static const activity = Screen<Never>._(_Screens.activity);
  static const workout = Screen<String>._(_Screens.workout);
  static const exercise = Screen<String>._(_Screens.exercise);
  static const exerciseSet = Screen<String>._(_Screens.exerciseSet);
  static const deepDemo = Screen<Never>._(_Screens.deepDemo);
  static const levelA = Screen<String>._(_Screens.levelA);
  static const levelB = Screen<String>._(_Screens.levelB);
  static const levelC = Screen<String>._(_Screens.levelC);
  static const levelD = Screen<String>._(_Screens.levelD);
  static const levelE = Screen<String>._(_Screens.levelE);
  static const levelF = Screen<String>._(_Screens.levelF);
  static const integrations = Screen<Never>._(_Screens.integrations);
  static const apiKeys = Screen<Never>._(_Screens.apiKeys);
  static const studio = Screen<Never>._(CreatorStudio.studio);
  static const analytics = Screen<Never>._(CreatorStudio.analytics);
  static const audience = Screen<Never>._(CreatorStudio.audience);
  static const scheduled = Screen<Never>._(CreatorStudio.scheduled);
  static const scheduledPost = Screen<String>._(CreatorStudio.scheduledPost);
  static const editScheduled = Screen<String>._(CreatorStudio.editScheduled);
  static const monetization = Screen<Never>._(CreatorStudio.monetization);
  static const payouts = Screen<Never>._(CreatorStudio.payouts);
  static const events = Screen<Never>._(Events.events);
  static const event = Screen<String>._(Events.event);
  static const attendees = Screen<String>._(Events.attendees);
  static const editEvent = Screen<String>._(Events.editEvent);
  static const createEvent = Screen<Never>._(Events.createEvent);
  static const tickets = Screen<String>._(Events.tickets);
  static const support = Screen<Never>._(Support.support);
  static const supportTickets = Screen<Never>._(Support.supportTickets);
  static const supportTicket = Screen<String>._(Support.supportTicket);
  static const newTicket = Screen<Never>._(Support.newTicket);
  static const knowledgeBase = Screen<Never>._(Support.knowledgeBase);
  static const article = Screen<String>._(Support.article);
  static const admin = Screen<Never>._(Admin.admin);
  static const adminUsers = Screen<Never>._(Admin.adminUsers);
  static const adminUser = Screen<String>._(Admin.adminUser);
  static const adminAuditLog = Screen<Never>._(Admin.adminAuditLog);
  static const adminRole = Screen<String>._(Admin.adminRole);
  static const adminFeatureFlags = Screen<Never>._(Admin.adminFeatureFlags);
  static const webhooks = Screen<Never>._(Admin.webhooks);
  static const webhook = Screen<String>._(Admin.webhook);
  static Screen<Object?> _forSpec(Enum spec) => _bySpec[spec]!;

  /// The [Screen] constant for a grammar row — `pageOf`'s bridge from
  /// `PageCtx.screen` to the typed surface (per-screen meta extensions
  /// switch on the constants).
  static Screen<Object?> from(Enum spec) => _bySpec[spec]!;
  static const _bySpec = <Enum, Screen<Object?>>{
    BootScreen.root: Screen<Never>._(BootScreen.root),
    _Screens.splash: splash,
    _Screens.signIn: signIn,
    _Screens.signUp: signUp,
    _Screens.onboarding: onboarding,
    _Screens.forgotPassword: forgotPassword,
    _Screens.resetPassword: resetPassword,
    _Screens.verifyEmail: verifyEmail,
    _Screens.twoFactor: twoFactor,
    _Screens.home: home,
    _Screens.feed: feed,
    _Screens.composePost: composePost,
    _Screens.story: story,
    _Screens.post: post,
    _Screens.comment: comment,
    _Screens.postAuthor: postAuthor,
    _Screens.postComments: postComments,
    _Screens.postLikes: postLikes,
    _Screens.editPost: editPost,
    _Screens.repost: repost,
    _Screens.discover: discover,
    _Screens.trending: trending,
    _Screens.topics: topics,
    _Screens.topic: topic,
    _Screens.subtopic: subtopic,
    _Screens.hashtag: hashtag,
    _Screens.liveNow: liveNow,
    _Screens.liveRoom: liveRoom,
    _Screens.nearby: nearby,
    _Screens.marketplace: marketplace,
    _Screens.categories: categories,
    _Screens.category: category,
    _Screens.listing: listing,
    _Screens.listingVariant: listingVariant,
    _Screens.editListing: editListing,
    _Screens.sellerProfile: sellerProfile,
    _Screens.cart: cart,
    _Screens.checkout: checkout,
    _Screens.orderConfirmation: orderConfirmation,
    _Screens.myOrders: myOrders,
    _Screens.order: order,
    _Screens.wishlist: wishlist,
    _Screens.messages: messages,
    _Screens.chats: chats,
    _Screens.chat: chat,
    _Screens.thread: thread,
    _Screens.message: message,
    _Screens.messageReply: messageReply,
    _Screens.voiceCall: voiceCall,
    _Screens.newChat: newChat,
    _Screens.groupChat: groupChat,
    _Screens.groupInfo: groupInfo,
    _Screens.wallet: wallet,
    _Screens.balance: balance,
    _Screens.accounts: accounts,
    _Screens.account: account,
    _Screens.transactions: transactions,
    _Screens.transaction: transaction,
    _Screens.transactionItem: transactionItem,
    _Screens.sendMoney: sendMoney,
    _Screens.receiveMoney: receiveMoney,
    _Screens.paymentMethods: paymentMethods,
    _Screens.addCard: addCard,
    _Screens.card: card,
    _Screens.statements: statements,
    _Screens.statement: statement,
    _Screens.profile: profile,
    _Screens.userProfile: userProfile,
    _Screens.followers: followers,
    _Screens.following: following,
    _Screens.connection: connection,
    _Screens.mutualConnections: mutualConnections,
    _Screens.editProfile: editProfile,
    _Screens.achievements: achievements,
    _Screens.badges: badges,
    _Screens.badge: badge,
    _Screens.savedPosts: savedPosts,
    _Screens.drafts: drafts,
    _Screens.myListings: myListings,
    _Screens.notifications: notifications,
    _Screens.notificationSettings: notificationSettings,
    _Screens.search: search,
    _Screens.searchResults: searchResults,
    _Screens.settings: settings,
    _Screens.accountSettings: accountSettings,
    _Screens.security: security,
    _Screens.twoFactorSettings: twoFactorSettings,
    _Screens.privacy: privacy,
    _Screens.appearance: appearance,
    _Screens.language: language,
    _Screens.connectedApps: connectedApps,
    _Screens.about: about,
    _Screens.help: help,
    _Screens.helpCategory: helpCategory,
    _Screens.faq: faq,
    _Screens.faqArticle: faqArticle,
    _Screens.feedback: feedback,
    _Screens.blockedUsers: blockedUsers,
    _Screens.devices: devices,
    _Screens.device: device,
    _Screens.sessions: sessions,
    _Screens.session: session,
    _Screens.dataExport: dataExport,
    _Screens.deleteAccount: deleteAccount,
    _Screens.workspace: workspace,
    _Screens.project: project,
    _Screens.board: board,
    _Screens.taskList: taskList,
    _Screens.task: task,
    _Screens.subtask: subtask,
    _Screens.checklistItem: checklistItem,
    _Screens.editTask: editTask,
    _Screens.taskComment: taskComment,
    _Screens.assignee: assignee,
    _Screens.label: label,
    _Screens.milestone: milestone,
    _Screens.sprint: sprint,
    _Screens.forum: forum,
    _Screens.forumCategory: forumCategory,
    _Screens.forumThread: forumThread,
    _Screens.forumReply: forumReply,
    _Screens.reportThread: reportThread,
    _Screens.learn: learn,
    _Screens.course: course,
    _Screens.courseModule: courseModule,
    _Screens.lesson: lesson,
    _Screens.quiz: quiz,
    _Screens.question: question,
    _Screens.answer: answer,
    _Screens.courseReview: courseReview,
    _Screens.instructor: instructor,
    _Screens.certificate: certificate,
    _Screens.shop: shop,
    _Screens.shopDept: shopDept,
    _Screens.shopCategory: shopCategory,
    _Screens.shopSubcategory: shopSubcategory,
    _Screens.product: product,
    _Screens.productVariant: productVariant,
    _Screens.productReview: productReview,
    _Screens.brand: brand,
    _Screens.compareProducts: compareProducts,
    _Screens.activity: activity,
    _Screens.workout: workout,
    _Screens.exercise: exercise,
    _Screens.exerciseSet: exerciseSet,
    _Screens.deepDemo: deepDemo,
    _Screens.levelA: levelA,
    _Screens.levelB: levelB,
    _Screens.levelC: levelC,
    _Screens.levelD: levelD,
    _Screens.levelE: levelE,
    _Screens.levelF: levelF,
    _Screens.integrations: integrations,
    _Screens.apiKeys: apiKeys,
    CreatorStudio.studio: studio,
    CreatorStudio.analytics: analytics,
    CreatorStudio.audience: audience,
    CreatorStudio.scheduled: scheduled,
    CreatorStudio.scheduledPost: scheduledPost,
    CreatorStudio.editScheduled: editScheduled,
    CreatorStudio.monetization: monetization,
    CreatorStudio.payouts: payouts,
    Events.events: events,
    Events.event: event,
    Events.attendees: attendees,
    Events.editEvent: editEvent,
    Events.createEvent: createEvent,
    Events.tickets: tickets,
    Support.support: support,
    Support.supportTickets: supportTickets,
    Support.supportTicket: supportTicket,
    Support.newTicket: newTicket,
    Support.knowledgeBase: knowledgeBase,
    Support.article: article,
    Admin.admin: admin,
    Admin.adminUsers: adminUsers,
    Admin.adminUser: adminUser,
    Admin.adminAuditLog: adminAuditLog,
    Admin.adminRole: adminRole,
    Admin.adminFeatureFlags: adminFeatureFlags,
    Admin.webhooks: webhooks,
    Admin.webhook: webhook,
  };

  /// The live active stack as wrappers: .current/.currentId/.tab/
  /// .screens/.reachable, extensible without touching Screen.
  static NavStack<Screen<Object?>> get stack => NavStack([
    for (final e in _Screens.graph.stack) NavEntry(_forSpec(e.screen), e.id),
  ]);
  static const _treeSignature =
      'activityK(workout(exercise(exerciseSet(exerciseSetA()))));deepDemoK(levelA(levelB(levelC(levelD(levelE(levelF(levelAA(),levelBA(),levelCA(),levelDA(),levelEA(),levelFA())))))));discoverK(events(createEvent(),event(attendees(),editEvent(),tickets())),liveNow(liveRoom(liveRoomA())),nearby(),topics(),trending(hashtag(hashtagA()),topic(subtopic(subtopicA(),topicA()),topicA()),userProfile()));forgotPassword(resetPassword());forumK(forumCategory(forumThread(forumReply(forumReplyA(),userProfile()),forumThreadA(),reportThread())));homeK(feed(composePost(),post(comment(commentA(),postA()),editPost(),postA(),postAuthor(postA(),postAuthorA()),postComments(),postLikes(),repost()),story(storyA()),userProfile()),studio(analytics(audience()),monetization(payouts()),scheduled(scheduledPost(editScheduled()))));learnK(course(certificate(),courseModule(instructor(),lesson(courseReview(),quiz(question(answer(),questionA()))))));marketplaceK(cart(checkout(orderConfirmation())),categories(category(categoryA(),listing(editListing(),listingA(),listingVariant(listingVariantA()),sellerProfile(listingA(),sellerProfileA())))),myOrders(order(orderA())),wishlist());messagesK(chats(chat(thread(message(chatA(),messageReply(messageReplyA())),threadA()),userProfile(),voiceCall())),groupChat(groupChatA(),groupInfo()),newChat());notificationsK(notificationSettings());onboarding();profileK(achievements(),badges(badge(badgeA())),drafts(),editProfile(),followers(connection(connectionA(),mutualConnections())),following(),myListings(),savedPosts(),userProfile());searchK(searchResults());settingsK(about(feedback(),help(helpCategory(faq(faqArticle())))),accountSettings(),admin(adminAuditLog(),adminFeatureFlags(),adminUsers(adminUser(adminRole())),webhooks(webhook())),appearance(),blockedUsers(),connectedApps(),dataExport(),deleteAccount(),devices(device(session(sessionA()),sessions())),integrations(apiKeys()),language(),privacy(),security(twoFactorSettings()),support(knowledgeBase(article()),newTicket(),supportTickets(supportTicket())));shopK(compareProducts(),shopDept(shopCategory(shopSubcategory(product(brand(),productA(),productReview(),productVariant(productVariantA()))))));signIn();signUp();splash();twoFactor();verifyEmail();walletK(accounts(account(accountA(),statements(statement()),transactions(transaction(transactionA(),transactionItem(transactionItemA()))))),balance(),paymentMethods(addCard(),card()),receiveMoney(),sendMoney());workspaceK(project(board(taskList(milestone(),sprint(),task(assignee(),editTask(),label(),subtask(checklistItem(checklistItemA()),subtaskA()),taskA(),taskComment()))),userProfile()))';

  /// True when this generated code still matches the live tree.
  static bool get isCodegenFresh =>
      _Screens.graph.structureSignature == _treeSignature;
  static final bool _fresh = () {
    assert(
      isCodegenFresh,
      'canon: the navigation tree changed but generated code is stale — run build_runner.',
    );
    return true;
  }();

  /// THE app host — a `RouterDelegate`. Wire it once:
  /// `MaterialApp.router(routerDelegate: Screen.manager)`.
  static NavDelegate get manager {
    assert(_fresh);
    return _Screens.graph.delegate;
  }

  /// Executes a resolved [Hop] — a kick-start or a parsed [Place].
  static N go<N extends AnyNav>(Hop<N> hop) {
    for (final (s, i) in hop.chain) _Screens.graph.go<Object?>(s, i);
    return hop.nav;
  }

  /// If the live stack ends with this selector path (every pinned id),
  /// its nav — else null.
  static N? on<N extends AnyNav>(On<N> which) {
    if (which is OnParentOf<N>) {
      return which.parents.contains(_Screens.graph.current) ? which.nav : null;
    }
    final st = _Screens.graph.stack;
    final specs = which.specs;
    if (st.length < specs.length) return null;
    final off = st.length - specs.length;
    for (var i = 0; i < specs.length; i++) {
      if (st[off + i].screen != specs[i]) return null;
      final wid = which.ids[i];
      if (wid != null && st[off + i].id != wid) return null;
    }
    return _atOf(specs.last) as N;
  }

  /// The placement if this selector path is anywhere on the live stack
  /// (front OR buried) — for `Screen.at(.x)?.surface()`. Else null.
  static N? at<N extends AnyNav>(On<N> which) {
    if (which is OnParentOf<N>) return null;
    final st = _Screens.graph.stack;
    final specs = which.specs;
    outer:
    for (var e = st.length - 1; e >= specs.length - 1; e--) {
      final off = e - specs.length + 1;
      for (var i = 0; i < specs.length; i++) {
        if (st[off + i].screen != specs[i]) continue outer;
        final wid = which.ids[i];
        if (wid != null && st[off + i].id != wid) continue outer;
      }
      return _atOf(specs.last) as N;
    }
    return null;
  }

  /// The nav of the screen OWNING [context] (this widget's screen),
  /// typed by [which]. Total: its verbs go from that screen.
  /// Throws a [StateError] when [context] stands at another placement.
  static N ownerOf<N extends AnyNav>(BuildContext context, On<N> which) {
    final entry = ScreenScope.entryOf(context);
    final own = entry.screen;
    if (which is OnParentOf<N>) {
      if (which.parents.contains(own)) return which.at(own);
      throw StateError('ownerOf: ${own.name} is no parent of this push');
    }
    final chain = _Screens.graph.chainOf(entry);
    final specs = which.specs;
    final off = chain.length - specs.length;
    for (var i = 0; i < specs.length; i++) {
      if (off < 0 || chain[off + i] != specs[i]) {
        throw StateError(
          'ownerOf(${specs.map((s) => s.name).join('.')}) at ${chain.map((s) => s.name).join('/')}',
        );
      }
    }
    return _placementOf(own, chain) as N;
  }

  /// THE navigation resolver — assign once (ideally in `main` before
  /// `runApp`). Fires with the cold-start link (or null), then on every
  /// deep link — web URL + mobile app-link, one channel.
  static set resolver(void Function(Url? url) fn) => _Screens.graph.setResolver(
    (url) => fn(parseUrl(url)),
    boot:
        _Screens.graph.bootUrl ??
        WidgetsBinding.instance.platformDispatcher.defaultRouteName,
  );

  /// Pops the active top when it sits on a parent; a no-op at a root.
  static void pop() {
    if (_Screens.graph.currentChain.length > 1) _Screens.graph.pop();
  }

  /// A broadcast stream of committed navigations as typed snapshots:
  /// `from`/`to` are ScreenEntry stacks; `switch (e.destination)` for
  /// the landed screen + its typed id. Filter with `.where`.
  static Stream<ScreenNavigation> get navigations =>
      _Screens.graph.navigations.map(ScreenNavigation._);
  static SplashNav goSplash() {
    _Screens.graph.go(_Screens.splash);
    return const SplashNav._();
  }

  static SignInNav goSignIn() {
    _Screens.graph.go(_Screens.signIn);
    return const SignInNav._();
  }

  static SignUpNav goSignUp() {
    _Screens.graph.go(_Screens.signUp);
    return const SignUpNav._();
  }

  static OnboardingNav goOnboarding() {
    _Screens.graph.go(_Screens.onboarding);
    return const OnboardingNav._();
  }

  static ForgotPasswordNav goForgotPassword() {
    _Screens.graph.go(_Screens.forgotPassword);
    return const ForgotPasswordNav._();
  }

  static ResetPasswordNav goResetPassword(String id) {
    _Screens.graph.go(_Screens.resetPassword, id);
    return const ResetPasswordNav._();
  }

  static VerifyEmailNav goVerifyEmail() {
    _Screens.graph.go(_Screens.verifyEmail);
    return const VerifyEmailNav._();
  }

  static TwoFactorNav goTwoFactor() {
    _Screens.graph.go(_Screens.twoFactor);
    return const TwoFactorNav._();
  }

  static HomeNav goHome() {
    _Screens.graph.go(_Screens.home);
    return const HomeNav._();
  }

  static FeedNav goFeed() {
    _Screens.graph.go(_Screens.feed);
    return const FeedNav._();
  }

  static ComposePostNav goComposePost() {
    _Screens.graph.go(_Screens.composePost);
    return const ComposePostNav._();
  }

  static StoryNav goStory(String id) {
    _Screens.graph.go(_Screens.story, id);
    return const StoryNav._();
  }

  static PostNav goPost(String id) {
    _Screens.graph.go(_Screens.post, id);
    return const PostNav._();
  }

  static PostCommentsNav goPostComments(String id) {
    _Screens.graph.go(_Screens.post, id);
    _Screens.graph.go(_Screens.postComments, id, true);
    return const PostCommentsNav._();
  }

  static PostLikesNav goPostLikes(String id) {
    _Screens.graph.go(_Screens.post, id);
    _Screens.graph.go(_Screens.postLikes, id, true);
    return const PostLikesNav._();
  }

  static EditPostNav goEditPost(String id) {
    _Screens.graph.go(_Screens.post, id);
    _Screens.graph.go(_Screens.editPost, id, true);
    return const EditPostNav._();
  }

  static RepostNav goRepost(String id) {
    _Screens.graph.go(_Screens.post, id);
    _Screens.graph.go(_Screens.repost, id, true);
    return const RepostNav._();
  }

  static DiscoverNav goDiscover() {
    _Screens.graph.go(_Screens.discover);
    return const DiscoverNav._();
  }

  static TrendingNav goTrending() {
    _Screens.graph.go(_Screens.trending);
    return const TrendingNav._();
  }

  static TopicsNav goTopics() {
    _Screens.graph.go(_Screens.topics);
    return const TopicsNav._();
  }

  static TopicNav goTopic(String id) {
    _Screens.graph.go(_Screens.topic, id);
    return const TopicNav._();
  }

  static HashtagNav goHashtag(String id) {
    _Screens.graph.go(_Screens.hashtag, id);
    return const HashtagNav._();
  }

  static LiveNowNav goLiveNow() {
    _Screens.graph.go(_Screens.liveNow);
    return const LiveNowNav._();
  }

  static LiveRoomNav goLiveRoom(String id) {
    _Screens.graph.go(_Screens.liveRoom, id);
    return const LiveRoomNav._();
  }

  static NearbyNav goNearby() {
    _Screens.graph.go(_Screens.nearby);
    return const NearbyNav._();
  }

  static MarketplaceNav goMarketplace() {
    _Screens.graph.go(_Screens.marketplace);
    return const MarketplaceNav._();
  }

  static CategoriesNav goCategories() {
    _Screens.graph.go(_Screens.categories);
    return const CategoriesNav._();
  }

  static CategoryNav goCategory(String id) {
    _Screens.graph.go(_Screens.category, id);
    return const CategoryNav._();
  }

  static CartNav goCart() {
    _Screens.graph.go(_Screens.cart);
    return const CartNav._();
  }

  static CheckoutNav goCheckout(String id) {
    _Screens.graph.go(_Screens.checkout, id);
    return const CheckoutNav._();
  }

  static MyOrdersNav goMyOrders() {
    _Screens.graph.go(_Screens.myOrders);
    return const MyOrdersNav._();
  }

  static OrderNav goOrder(String id) {
    _Screens.graph.go(_Screens.order, id);
    return const OrderNav._();
  }

  static WishlistNav goWishlist() {
    _Screens.graph.go(_Screens.wishlist);
    return const WishlistNav._();
  }

  static MessagesNav goMessages() {
    _Screens.graph.go(_Screens.messages);
    return const MessagesNav._();
  }

  static ChatsNav goChats() {
    _Screens.graph.go(_Screens.chats);
    return const ChatsNav._();
  }

  static ChatNav goChat(String id) {
    _Screens.graph.go(_Screens.chat, id);
    return const ChatNav._();
  }

  static VoiceCallNav goVoiceCall(String id) {
    _Screens.graph.go(_Screens.chat, id);
    _Screens.graph.go(_Screens.voiceCall, id, true);
    return const VoiceCallNav._();
  }

  static NewChatNav goNewChat() {
    _Screens.graph.go(_Screens.newChat);
    return const NewChatNav._();
  }

  static GroupChatNav goGroupChat(String id) {
    _Screens.graph.go(_Screens.groupChat, id);
    return const GroupChatNav._();
  }

  static GroupInfoNav goGroupInfo(String id) {
    _Screens.graph.go(_Screens.groupChat, id);
    _Screens.graph.go(_Screens.groupInfo, id, true);
    return const GroupInfoNav._();
  }

  static WalletNav goWallet() {
    _Screens.graph.go(_Screens.wallet);
    return const WalletNav._();
  }

  static BalanceNav goBalance() {
    _Screens.graph.go(_Screens.balance);
    return const BalanceNav._();
  }

  static AccountsNav goAccounts() {
    _Screens.graph.go(_Screens.accounts);
    return const AccountsNav._();
  }

  static AccountNav goAccount(String id) {
    _Screens.graph.go(_Screens.account, id);
    return const AccountNav._();
  }

  static SendMoneyNav goSendMoney() {
    _Screens.graph.go(_Screens.sendMoney);
    return const SendMoneyNav._();
  }

  static ReceiveMoneyNav goReceiveMoney() {
    _Screens.graph.go(_Screens.receiveMoney);
    return const ReceiveMoneyNav._();
  }

  static PaymentMethodsNav goPaymentMethods() {
    _Screens.graph.go(_Screens.paymentMethods);
    return const PaymentMethodsNav._();
  }

  static AddCardNav goAddCard() {
    _Screens.graph.go(_Screens.addCard);
    return const AddCardNav._();
  }

  static CardNav goCard(String id) {
    _Screens.graph.go(_Screens.card, id);
    return const CardNav._();
  }

  static ProfileNav goProfile() {
    _Screens.graph.go(_Screens.profile);
    return const ProfileNav._();
  }

  static FollowersNav goFollowers(String id) {
    _Screens.graph.go(_Screens.followers, id);
    return const FollowersNav._();
  }

  static FollowingNav goFollowing(String id) {
    _Screens.graph.go(_Screens.following, id);
    return const FollowingNav._();
  }

  static EditProfileNav goEditProfile() {
    _Screens.graph.go(_Screens.editProfile);
    return const EditProfileNav._();
  }

  static AchievementsNav goAchievements() {
    _Screens.graph.go(_Screens.achievements);
    return const AchievementsNav._();
  }

  static BadgesNav goBadges() {
    _Screens.graph.go(_Screens.badges);
    return const BadgesNav._();
  }

  static BadgeNav goBadge(String id) {
    _Screens.graph.go(_Screens.badge, id);
    return const BadgeNav._();
  }

  static SavedPostsNav goSavedPosts() {
    _Screens.graph.go(_Screens.savedPosts);
    return const SavedPostsNav._();
  }

  static DraftsNav goDrafts() {
    _Screens.graph.go(_Screens.drafts);
    return const DraftsNav._();
  }

  static MyListingsNav goMyListings() {
    _Screens.graph.go(_Screens.myListings);
    return const MyListingsNav._();
  }

  static NotificationsNav goNotifications() {
    _Screens.graph.go(_Screens.notifications);
    return const NotificationsNav._();
  }

  static NotificationSettingsNav goNotificationSettings() {
    _Screens.graph.go(_Screens.notificationSettings);
    return const NotificationSettingsNav._();
  }

  static SearchNav goSearch() {
    _Screens.graph.go(_Screens.search);
    return const SearchNav._();
  }

  static SearchResultsNav goSearchResults() {
    _Screens.graph.go(_Screens.searchResults);
    return const SearchResultsNav._();
  }

  static SettingsNav goSettings() {
    _Screens.graph.go(_Screens.settings);
    return const SettingsNav._();
  }

  static AccountSettingsNav goAccountSettings() {
    _Screens.graph.go(_Screens.accountSettings);
    return const AccountSettingsNav._();
  }

  static SecurityNav goSecurity() {
    _Screens.graph.go(_Screens.security);
    return const SecurityNav._();
  }

  static TwoFactorSettingsNav goTwoFactorSettings() {
    _Screens.graph.go(_Screens.twoFactorSettings);
    return const TwoFactorSettingsNav._();
  }

  static PrivacyNav goPrivacy() {
    _Screens.graph.go(_Screens.privacy);
    return const PrivacyNav._();
  }

  static AppearanceNav goAppearance() {
    _Screens.graph.go(_Screens.appearance);
    return const AppearanceNav._();
  }

  static LanguageNav goLanguage() {
    _Screens.graph.go(_Screens.language);
    return const LanguageNav._();
  }

  static ConnectedAppsNav goConnectedApps() {
    _Screens.graph.go(_Screens.connectedApps);
    return const ConnectedAppsNav._();
  }

  static AboutNav goAbout() {
    _Screens.graph.go(_Screens.about);
    return const AboutNav._();
  }

  static HelpNav goHelp() {
    _Screens.graph.go(_Screens.help);
    return const HelpNav._();
  }

  static HelpCategoryNav goHelpCategory(String id) {
    _Screens.graph.go(_Screens.helpCategory, id);
    return const HelpCategoryNav._();
  }

  static FeedbackNav goFeedback() {
    _Screens.graph.go(_Screens.feedback);
    return const FeedbackNav._();
  }

  static BlockedUsersNav goBlockedUsers() {
    _Screens.graph.go(_Screens.blockedUsers);
    return const BlockedUsersNav._();
  }

  static DevicesNav goDevices() {
    _Screens.graph.go(_Screens.devices);
    return const DevicesNav._();
  }

  static DeviceNav goDevice(String id) {
    _Screens.graph.go(_Screens.device, id);
    return const DeviceNav._();
  }

  static DataExportNav goDataExport() {
    _Screens.graph.go(_Screens.dataExport);
    return const DataExportNav._();
  }

  static DeleteAccountNav goDeleteAccount() {
    _Screens.graph.go(_Screens.deleteAccount);
    return const DeleteAccountNav._();
  }

  static WorkspaceNav goWorkspace() {
    _Screens.graph.go(_Screens.workspace);
    return const WorkspaceNav._();
  }

  static ProjectNav goProject(String id) {
    _Screens.graph.go(_Screens.project, id);
    return const ProjectNav._();
  }

  static ForumNav goForum() {
    _Screens.graph.go(_Screens.forum);
    return const ForumNav._();
  }

  static ForumCategoryNav goForumCategory(String id) {
    _Screens.graph.go(_Screens.forumCategory, id);
    return const ForumCategoryNav._();
  }

  static LearnNav goLearn() {
    _Screens.graph.go(_Screens.learn);
    return const LearnNav._();
  }

  static CourseNav goCourse(String id) {
    _Screens.graph.go(_Screens.course, id);
    return const CourseNav._();
  }

  static CertificateNav goCertificate(String id) {
    _Screens.graph.go(_Screens.course, id);
    _Screens.graph.go(_Screens.certificate, id, true);
    return const CertificateNav._();
  }

  static ShopNav goShop() {
    _Screens.graph.go(_Screens.shop);
    return const ShopNav._();
  }

  static ShopDeptNav goShopDept(String id) {
    _Screens.graph.go(_Screens.shopDept, id);
    return const ShopDeptNav._();
  }

  static CompareProductsNav goCompareProducts() {
    _Screens.graph.go(_Screens.compareProducts);
    return const CompareProductsNav._();
  }

  static ActivityNav goActivity() {
    _Screens.graph.go(_Screens.activity);
    return const ActivityNav._();
  }

  static WorkoutNav goWorkout(String id) {
    _Screens.graph.go(_Screens.workout, id);
    return const WorkoutNav._();
  }

  static DeepDemoNav goDeepDemo() {
    _Screens.graph.go(_Screens.deepDemo);
    return const DeepDemoNav._();
  }

  static LevelANav goLevelA(String id) {
    _Screens.graph.go(_Screens.levelA, id);
    return const LevelANav._();
  }

  static IntegrationsNav goIntegrations() {
    _Screens.graph.go(_Screens.integrations);
    return const IntegrationsNav._();
  }

  static ApiKeysNav goApiKeys() {
    _Screens.graph.go(_Screens.apiKeys);
    return const ApiKeysNav._();
  }

  static StudioNav goStudio() {
    _Screens.graph.go(CreatorStudio.studio);
    return const StudioNav._();
  }

  static AnalyticsNav goAnalytics() {
    _Screens.graph.go(CreatorStudio.analytics);
    return const AnalyticsNav._();
  }

  static AudienceNav goAudience() {
    _Screens.graph.go(CreatorStudio.audience);
    return const AudienceNav._();
  }

  static ScheduledNav goScheduled() {
    _Screens.graph.go(CreatorStudio.scheduled);
    return const ScheduledNav._();
  }

  static ScheduledPostNav goScheduledPost(String id) {
    _Screens.graph.go(CreatorStudio.scheduledPost, id);
    return const ScheduledPostNav._();
  }

  static EditScheduledNav goEditScheduled(String id) {
    _Screens.graph.go(CreatorStudio.scheduledPost, id);
    _Screens.graph.go(CreatorStudio.editScheduled, id, true);
    return const EditScheduledNav._();
  }

  static MonetizationNav goMonetization() {
    _Screens.graph.go(CreatorStudio.monetization);
    return const MonetizationNav._();
  }

  static PayoutsNav goPayouts() {
    _Screens.graph.go(CreatorStudio.payouts);
    return const PayoutsNav._();
  }

  static EventsNav goEvents() {
    _Screens.graph.go(Events.events);
    return const EventsNav._();
  }

  static EventNav goEvent(String id) {
    _Screens.graph.go(Events.event, id);
    return const EventNav._();
  }

  static AttendeesNav goAttendees(String id) {
    _Screens.graph.go(Events.event, id);
    _Screens.graph.go(Events.attendees, id, true);
    return const AttendeesNav._();
  }

  static EditEventNav goEditEvent(String id) {
    _Screens.graph.go(Events.event, id);
    _Screens.graph.go(Events.editEvent, id, true);
    return const EditEventNav._();
  }

  static CreateEventNav goCreateEvent() {
    _Screens.graph.go(Events.createEvent);
    return const CreateEventNav._();
  }

  static TicketsNav goTickets(String id) {
    _Screens.graph.go(Events.event, id);
    _Screens.graph.go(Events.tickets, id, true);
    return const TicketsNav._();
  }

  static SupportNav goSupport() {
    _Screens.graph.go(Support.support);
    return const SupportNav._();
  }

  static SupportTicketsNav goSupportTickets() {
    _Screens.graph.go(Support.supportTickets);
    return const SupportTicketsNav._();
  }

  static SupportTicketNav goSupportTicket(String id) {
    _Screens.graph.go(Support.supportTicket, id);
    return const SupportTicketNav._();
  }

  static NewTicketNav goNewTicket() {
    _Screens.graph.go(Support.newTicket);
    return const NewTicketNav._();
  }

  static KnowledgeBaseNav goKnowledgeBase() {
    _Screens.graph.go(Support.knowledgeBase);
    return const KnowledgeBaseNav._();
  }

  static ArticleNav goArticle(String id) {
    _Screens.graph.go(Support.article, id);
    return const ArticleNav._();
  }

  static AdminNav goAdmin() {
    _Screens.graph.go(Admin.admin);
    return const AdminNav._();
  }

  static AdminUsersNav goAdminUsers() {
    _Screens.graph.go(Admin.adminUsers);
    return const AdminUsersNav._();
  }

  static AdminUserNav goAdminUser(String id) {
    _Screens.graph.go(Admin.adminUser, id);
    return const AdminUserNav._();
  }

  static AdminAuditLogNav goAdminAuditLog() {
    _Screens.graph.go(Admin.adminAuditLog);
    return const AdminAuditLogNav._();
  }

  static AdminFeatureFlagsNav goAdminFeatureFlags() {
    _Screens.graph.go(Admin.adminFeatureFlags);
    return const AdminFeatureFlagsNav._();
  }

  static WebhooksNav goWebhooks() {
    _Screens.graph.go(Admin.webhooks);
    return const WebhooksNav._();
  }

  static WebhookNav goWebhook(String id) {
    _Screens.graph.go(Admin.webhook, id);
    return const WebhookNav._();
  }
}

/// One committed navigation as typed [ScreenEntry] stacks.
final class ScreenNavigation._(final Navigation _n) {
  List<ScreenEntry> get from => [
    for (final e in _n.from)
      if (e.$1 != BootScreen.root) _entryOf(e.$1, e.$2),
  ];
  List<ScreenEntry> get to => [
    for (final e in _n.to)
      if (e.$1 != BootScreen.root) _entryOf(e.$1, e.$2),
  ];
  ScreenEntry get source => _entryOf(_n.source.$1, _n.source.$2);
  ScreenEntry get destination => _entryOf(_n.destination.$1, _n.destination.$2);
  NavDirection get direction => _n.direction;
  bool get isForward => _n.isForward;
  bool get isBackward => _n.isBackward;
  bool get isRoundTrip => _n.isRoundTrip;
  bool get isJump => _n.isJump;
}

/// One typed entry per screen — `switch` it for the screen-specific id.
sealed class const ScreenEntry();
final class const SplashEntry() extends ScreenEntry;
final class const SignInEntry() extends ScreenEntry;
final class const SignUpEntry() extends ScreenEntry;
final class const OnboardingEntry() extends ScreenEntry;
final class const ForgotPasswordEntry() extends ScreenEntry;
final class const ResetPasswordEntry(final String id) extends ScreenEntry;
final class const VerifyEmailEntry() extends ScreenEntry;
final class const TwoFactorEntry() extends ScreenEntry;
final class const HomeEntry() extends ScreenEntry;
final class const FeedEntry() extends ScreenEntry;
final class const ComposePostEntry() extends ScreenEntry;
final class const StoryEntry(final String id) extends ScreenEntry;
final class const PostEntry(final String id) extends ScreenEntry;
final class const CommentEntry(final String id) extends ScreenEntry;
final class const PostAuthorEntry(final String id) extends ScreenEntry;
final class const PostCommentsEntry(final String id) extends ScreenEntry;
final class const PostLikesEntry(final String id) extends ScreenEntry;
final class const EditPostEntry(final String id) extends ScreenEntry;
final class const RepostEntry(final String id) extends ScreenEntry;
final class const DiscoverEntry() extends ScreenEntry;
final class const TrendingEntry() extends ScreenEntry;
final class const TopicsEntry() extends ScreenEntry;
final class const TopicEntry(final String id) extends ScreenEntry;
final class const SubtopicEntry(final String id) extends ScreenEntry;
final class const HashtagEntry(final String id) extends ScreenEntry;
final class const LiveNowEntry() extends ScreenEntry;
final class const LiveRoomEntry(final String id) extends ScreenEntry;
final class const NearbyEntry() extends ScreenEntry;
final class const MarketplaceEntry() extends ScreenEntry;
final class const CategoriesEntry() extends ScreenEntry;
final class const CategoryEntry(final String id) extends ScreenEntry;
final class const ListingEntry(final String id) extends ScreenEntry;
final class const ListingVariantEntry(final String id) extends ScreenEntry;
final class const EditListingEntry(final String id) extends ScreenEntry;
final class const SellerProfileEntry(final String id) extends ScreenEntry;
final class const CartEntry() extends ScreenEntry;
final class const CheckoutEntry(final String id) extends ScreenEntry;
final class const OrderConfirmationEntry(final String id) extends ScreenEntry;
final class const MyOrdersEntry() extends ScreenEntry;
final class const OrderEntry(final String id) extends ScreenEntry;
final class const WishlistEntry() extends ScreenEntry;
final class const MessagesEntry() extends ScreenEntry;
final class const ChatsEntry() extends ScreenEntry;
final class const ChatEntry(final String id) extends ScreenEntry;
final class const ThreadEntry(final String id) extends ScreenEntry;
final class const MessageEntry(final String id) extends ScreenEntry;
final class const MessageReplyEntry(final String id) extends ScreenEntry;
final class const VoiceCallEntry(final String id) extends ScreenEntry;
final class const NewChatEntry() extends ScreenEntry;
final class const GroupChatEntry(final String id) extends ScreenEntry;
final class const GroupInfoEntry(final String id) extends ScreenEntry;
final class const WalletEntry() extends ScreenEntry;
final class const BalanceEntry() extends ScreenEntry;
final class const AccountsEntry() extends ScreenEntry;
final class const AccountEntry(final String id) extends ScreenEntry;
final class const TransactionsEntry() extends ScreenEntry;
final class const TransactionEntry(final String id) extends ScreenEntry;
final class const TransactionItemEntry(final String id) extends ScreenEntry;
final class const SendMoneyEntry() extends ScreenEntry;
final class const ReceiveMoneyEntry() extends ScreenEntry;
final class const PaymentMethodsEntry() extends ScreenEntry;
final class const AddCardEntry() extends ScreenEntry;
final class const CardEntry(final String id) extends ScreenEntry;
final class const StatementsEntry() extends ScreenEntry;
final class const StatementEntry(final String id) extends ScreenEntry;
final class const ProfileEntry() extends ScreenEntry;
final class const UserProfileEntry(final String id) extends ScreenEntry;
final class const FollowersEntry(final String id) extends ScreenEntry;
final class const FollowingEntry(final String id) extends ScreenEntry;
final class const ConnectionEntry(final String id) extends ScreenEntry;
final class const MutualConnectionsEntry() extends ScreenEntry;
final class const EditProfileEntry() extends ScreenEntry;
final class const AchievementsEntry() extends ScreenEntry;
final class const BadgesEntry() extends ScreenEntry;
final class const BadgeEntry(final String id) extends ScreenEntry;
final class const SavedPostsEntry() extends ScreenEntry;
final class const DraftsEntry() extends ScreenEntry;
final class const MyListingsEntry() extends ScreenEntry;
final class const NotificationsEntry() extends ScreenEntry;
final class const NotificationSettingsEntry() extends ScreenEntry;
final class const SearchEntry() extends ScreenEntry;
final class const SearchResultsEntry() extends ScreenEntry;
final class const SettingsEntry() extends ScreenEntry;
final class const AccountSettingsEntry() extends ScreenEntry;
final class const SecurityEntry() extends ScreenEntry;
final class const TwoFactorSettingsEntry() extends ScreenEntry;
final class const PrivacyEntry() extends ScreenEntry;
final class const AppearanceEntry() extends ScreenEntry;
final class const LanguageEntry() extends ScreenEntry;
final class const ConnectedAppsEntry() extends ScreenEntry;
final class const AboutEntry() extends ScreenEntry;
final class const HelpEntry() extends ScreenEntry;
final class const HelpCategoryEntry(final String id) extends ScreenEntry;
final class const FaqEntry() extends ScreenEntry;
final class const FaqArticleEntry(final String id) extends ScreenEntry;
final class const FeedbackEntry() extends ScreenEntry;
final class const BlockedUsersEntry() extends ScreenEntry;
final class const DevicesEntry() extends ScreenEntry;
final class const DeviceEntry(final String id) extends ScreenEntry;
final class const SessionsEntry() extends ScreenEntry;
final class const SessionEntry(final String id) extends ScreenEntry;
final class const DataExportEntry() extends ScreenEntry;
final class const DeleteAccountEntry() extends ScreenEntry;
final class const WorkspaceEntry() extends ScreenEntry;
final class const ProjectEntry(final String id) extends ScreenEntry;
final class const BoardEntry(final String id) extends ScreenEntry;
final class const TaskListEntry(final String id) extends ScreenEntry;
final class const TaskEntry(final String id) extends ScreenEntry;
final class const SubtaskEntry(final String id) extends ScreenEntry;
final class const ChecklistItemEntry(final String id) extends ScreenEntry;
final class const EditTaskEntry(final String id) extends ScreenEntry;
final class const TaskCommentEntry(final String id) extends ScreenEntry;
final class const AssigneeEntry(final String id) extends ScreenEntry;
final class const LabelEntry(final String id) extends ScreenEntry;
final class const MilestoneEntry(final String id) extends ScreenEntry;
final class const SprintEntry(final String id) extends ScreenEntry;
final class const ForumEntry() extends ScreenEntry;
final class const ForumCategoryEntry(final String id) extends ScreenEntry;
final class const ForumThreadEntry(final String id) extends ScreenEntry;
final class const ForumReplyEntry(final String id) extends ScreenEntry;
final class const ReportThreadEntry(final String id) extends ScreenEntry;
final class const LearnEntry() extends ScreenEntry;
final class const CourseEntry(final String id) extends ScreenEntry;
final class const CourseModuleEntry(final String id) extends ScreenEntry;
final class const LessonEntry(final String id) extends ScreenEntry;
final class const QuizEntry(final String id) extends ScreenEntry;
final class const QuestionEntry(final String id) extends ScreenEntry;
final class const AnswerEntry(final String id) extends ScreenEntry;
final class const CourseReviewEntry(final String id) extends ScreenEntry;
final class const InstructorEntry(final String id) extends ScreenEntry;
final class const CertificateEntry(final String id) extends ScreenEntry;
final class const ShopEntry() extends ScreenEntry;
final class const ShopDeptEntry(final String id) extends ScreenEntry;
final class const ShopCategoryEntry(final String id) extends ScreenEntry;
final class const ShopSubcategoryEntry(final String id) extends ScreenEntry;
final class const ProductEntry(final String id) extends ScreenEntry;
final class const ProductVariantEntry(final String id) extends ScreenEntry;
final class const ProductReviewEntry(final String id) extends ScreenEntry;
final class const BrandEntry(final String id) extends ScreenEntry;
final class const CompareProductsEntry() extends ScreenEntry;
final class const ActivityEntry() extends ScreenEntry;
final class const WorkoutEntry(final String id) extends ScreenEntry;
final class const ExerciseEntry(final String id) extends ScreenEntry;
final class const ExerciseSetEntry(final String id) extends ScreenEntry;
final class const DeepDemoEntry() extends ScreenEntry;
final class const LevelAEntry(final String id) extends ScreenEntry;
final class const LevelBEntry(final String id) extends ScreenEntry;
final class const LevelCEntry(final String id) extends ScreenEntry;
final class const LevelDEntry(final String id) extends ScreenEntry;
final class const LevelEEntry(final String id) extends ScreenEntry;
final class const LevelFEntry(final String id) extends ScreenEntry;
final class const IntegrationsEntry() extends ScreenEntry;
final class const ApiKeysEntry() extends ScreenEntry;
final class const StudioEntry() extends ScreenEntry;
final class const AnalyticsEntry() extends ScreenEntry;
final class const AudienceEntry() extends ScreenEntry;
final class const ScheduledEntry() extends ScreenEntry;
final class const ScheduledPostEntry(final String id) extends ScreenEntry;
final class const EditScheduledEntry(final String id) extends ScreenEntry;
final class const MonetizationEntry() extends ScreenEntry;
final class const PayoutsEntry() extends ScreenEntry;
final class const EventsEntry() extends ScreenEntry;
final class const EventEntry(final String id) extends ScreenEntry;
final class const AttendeesEntry(final String id) extends ScreenEntry;
final class const EditEventEntry(final String id) extends ScreenEntry;
final class const CreateEventEntry() extends ScreenEntry;
final class const TicketsEntry(final String id) extends ScreenEntry;
final class const SupportEntry() extends ScreenEntry;
final class const SupportTicketsEntry() extends ScreenEntry;
final class const SupportTicketEntry(final String id) extends ScreenEntry;
final class const NewTicketEntry() extends ScreenEntry;
final class const KnowledgeBaseEntry() extends ScreenEntry;
final class const ArticleEntry(final String id) extends ScreenEntry;
final class const AdminEntry() extends ScreenEntry;
final class const AdminUsersEntry() extends ScreenEntry;
final class const AdminUserEntry(final String id) extends ScreenEntry;
final class const AdminAuditLogEntry() extends ScreenEntry;
final class const AdminRoleEntry(final String id) extends ScreenEntry;
final class const AdminFeatureFlagsEntry() extends ScreenEntry;
final class const WebhooksEntry() extends ScreenEntry;
final class const WebhookEntry(final String id) extends ScreenEntry;
ScreenEntry _entryOf(Enum s, Object? id) => switch (s) {
  _Screens.splash => const SplashEntry(),
  _Screens.signIn => const SignInEntry(),
  _Screens.signUp => const SignUpEntry(),
  _Screens.onboarding => const OnboardingEntry(),
  _Screens.forgotPassword => const ForgotPasswordEntry(),
  _Screens.resetPassword => ResetPasswordEntry(id as String),
  _Screens.verifyEmail => const VerifyEmailEntry(),
  _Screens.twoFactor => const TwoFactorEntry(),
  _Screens.home => const HomeEntry(),
  _Screens.feed => const FeedEntry(),
  _Screens.composePost => const ComposePostEntry(),
  _Screens.story => StoryEntry(id as String),
  _Screens.post => PostEntry(id as String),
  _Screens.comment => CommentEntry(id as String),
  _Screens.postAuthor => PostAuthorEntry(id as String),
  _Screens.postComments => PostCommentsEntry(id as String),
  _Screens.postLikes => PostLikesEntry(id as String),
  _Screens.editPost => EditPostEntry(id as String),
  _Screens.repost => RepostEntry(id as String),
  _Screens.discover => const DiscoverEntry(),
  _Screens.trending => const TrendingEntry(),
  _Screens.topics => const TopicsEntry(),
  _Screens.topic => TopicEntry(id as String),
  _Screens.subtopic => SubtopicEntry(id as String),
  _Screens.hashtag => HashtagEntry(id as String),
  _Screens.liveNow => const LiveNowEntry(),
  _Screens.liveRoom => LiveRoomEntry(id as String),
  _Screens.nearby => const NearbyEntry(),
  _Screens.marketplace => const MarketplaceEntry(),
  _Screens.categories => const CategoriesEntry(),
  _Screens.category => CategoryEntry(id as String),
  _Screens.listing => ListingEntry(id as String),
  _Screens.listingVariant => ListingVariantEntry(id as String),
  _Screens.editListing => EditListingEntry(id as String),
  _Screens.sellerProfile => SellerProfileEntry(id as String),
  _Screens.cart => const CartEntry(),
  _Screens.checkout => CheckoutEntry(id as String),
  _Screens.orderConfirmation => OrderConfirmationEntry(id as String),
  _Screens.myOrders => const MyOrdersEntry(),
  _Screens.order => OrderEntry(id as String),
  _Screens.wishlist => const WishlistEntry(),
  _Screens.messages => const MessagesEntry(),
  _Screens.chats => const ChatsEntry(),
  _Screens.chat => ChatEntry(id as String),
  _Screens.thread => ThreadEntry(id as String),
  _Screens.message => MessageEntry(id as String),
  _Screens.messageReply => MessageReplyEntry(id as String),
  _Screens.voiceCall => VoiceCallEntry(id as String),
  _Screens.newChat => const NewChatEntry(),
  _Screens.groupChat => GroupChatEntry(id as String),
  _Screens.groupInfo => GroupInfoEntry(id as String),
  _Screens.wallet => const WalletEntry(),
  _Screens.balance => const BalanceEntry(),
  _Screens.accounts => const AccountsEntry(),
  _Screens.account => AccountEntry(id as String),
  _Screens.transactions => const TransactionsEntry(),
  _Screens.transaction => TransactionEntry(id as String),
  _Screens.transactionItem => TransactionItemEntry(id as String),
  _Screens.sendMoney => const SendMoneyEntry(),
  _Screens.receiveMoney => const ReceiveMoneyEntry(),
  _Screens.paymentMethods => const PaymentMethodsEntry(),
  _Screens.addCard => const AddCardEntry(),
  _Screens.card => CardEntry(id as String),
  _Screens.statements => const StatementsEntry(),
  _Screens.statement => StatementEntry(id as String),
  _Screens.profile => const ProfileEntry(),
  _Screens.userProfile => UserProfileEntry(id as String),
  _Screens.followers => FollowersEntry(id as String),
  _Screens.following => FollowingEntry(id as String),
  _Screens.connection => ConnectionEntry(id as String),
  _Screens.mutualConnections => const MutualConnectionsEntry(),
  _Screens.editProfile => const EditProfileEntry(),
  _Screens.achievements => const AchievementsEntry(),
  _Screens.badges => const BadgesEntry(),
  _Screens.badge => BadgeEntry(id as String),
  _Screens.savedPosts => const SavedPostsEntry(),
  _Screens.drafts => const DraftsEntry(),
  _Screens.myListings => const MyListingsEntry(),
  _Screens.notifications => const NotificationsEntry(),
  _Screens.notificationSettings => const NotificationSettingsEntry(),
  _Screens.search => const SearchEntry(),
  _Screens.searchResults => const SearchResultsEntry(),
  _Screens.settings => const SettingsEntry(),
  _Screens.accountSettings => const AccountSettingsEntry(),
  _Screens.security => const SecurityEntry(),
  _Screens.twoFactorSettings => const TwoFactorSettingsEntry(),
  _Screens.privacy => const PrivacyEntry(),
  _Screens.appearance => const AppearanceEntry(),
  _Screens.language => const LanguageEntry(),
  _Screens.connectedApps => const ConnectedAppsEntry(),
  _Screens.about => const AboutEntry(),
  _Screens.help => const HelpEntry(),
  _Screens.helpCategory => HelpCategoryEntry(id as String),
  _Screens.faq => const FaqEntry(),
  _Screens.faqArticle => FaqArticleEntry(id as String),
  _Screens.feedback => const FeedbackEntry(),
  _Screens.blockedUsers => const BlockedUsersEntry(),
  _Screens.devices => const DevicesEntry(),
  _Screens.device => DeviceEntry(id as String),
  _Screens.sessions => const SessionsEntry(),
  _Screens.session => SessionEntry(id as String),
  _Screens.dataExport => const DataExportEntry(),
  _Screens.deleteAccount => const DeleteAccountEntry(),
  _Screens.workspace => const WorkspaceEntry(),
  _Screens.project => ProjectEntry(id as String),
  _Screens.board => BoardEntry(id as String),
  _Screens.taskList => TaskListEntry(id as String),
  _Screens.task => TaskEntry(id as String),
  _Screens.subtask => SubtaskEntry(id as String),
  _Screens.checklistItem => ChecklistItemEntry(id as String),
  _Screens.editTask => EditTaskEntry(id as String),
  _Screens.taskComment => TaskCommentEntry(id as String),
  _Screens.assignee => AssigneeEntry(id as String),
  _Screens.label => LabelEntry(id as String),
  _Screens.milestone => MilestoneEntry(id as String),
  _Screens.sprint => SprintEntry(id as String),
  _Screens.forum => const ForumEntry(),
  _Screens.forumCategory => ForumCategoryEntry(id as String),
  _Screens.forumThread => ForumThreadEntry(id as String),
  _Screens.forumReply => ForumReplyEntry(id as String),
  _Screens.reportThread => ReportThreadEntry(id as String),
  _Screens.learn => const LearnEntry(),
  _Screens.course => CourseEntry(id as String),
  _Screens.courseModule => CourseModuleEntry(id as String),
  _Screens.lesson => LessonEntry(id as String),
  _Screens.quiz => QuizEntry(id as String),
  _Screens.question => QuestionEntry(id as String),
  _Screens.answer => AnswerEntry(id as String),
  _Screens.courseReview => CourseReviewEntry(id as String),
  _Screens.instructor => InstructorEntry(id as String),
  _Screens.certificate => CertificateEntry(id as String),
  _Screens.shop => const ShopEntry(),
  _Screens.shopDept => ShopDeptEntry(id as String),
  _Screens.shopCategory => ShopCategoryEntry(id as String),
  _Screens.shopSubcategory => ShopSubcategoryEntry(id as String),
  _Screens.product => ProductEntry(id as String),
  _Screens.productVariant => ProductVariantEntry(id as String),
  _Screens.productReview => ProductReviewEntry(id as String),
  _Screens.brand => BrandEntry(id as String),
  _Screens.compareProducts => const CompareProductsEntry(),
  _Screens.activity => const ActivityEntry(),
  _Screens.workout => WorkoutEntry(id as String),
  _Screens.exercise => ExerciseEntry(id as String),
  _Screens.exerciseSet => ExerciseSetEntry(id as String),
  _Screens.deepDemo => const DeepDemoEntry(),
  _Screens.levelA => LevelAEntry(id as String),
  _Screens.levelB => LevelBEntry(id as String),
  _Screens.levelC => LevelCEntry(id as String),
  _Screens.levelD => LevelDEntry(id as String),
  _Screens.levelE => LevelEEntry(id as String),
  _Screens.levelF => LevelFEntry(id as String),
  _Screens.integrations => const IntegrationsEntry(),
  _Screens.apiKeys => const ApiKeysEntry(),
  CreatorStudio.studio => const StudioEntry(),
  CreatorStudio.analytics => const AnalyticsEntry(),
  CreatorStudio.audience => const AudienceEntry(),
  CreatorStudio.scheduled => const ScheduledEntry(),
  CreatorStudio.scheduledPost => ScheduledPostEntry(id as String),
  CreatorStudio.editScheduled => EditScheduledEntry(id as String),
  CreatorStudio.monetization => const MonetizationEntry(),
  CreatorStudio.payouts => const PayoutsEntry(),
  Events.events => const EventsEntry(),
  Events.event => EventEntry(id as String),
  Events.attendees => AttendeesEntry(id as String),
  Events.editEvent => EditEventEntry(id as String),
  Events.createEvent => const CreateEventEntry(),
  Events.tickets => TicketsEntry(id as String),
  Support.support => const SupportEntry(),
  Support.supportTickets => const SupportTicketsEntry(),
  Support.supportTicket => SupportTicketEntry(id as String),
  Support.newTicket => const NewTicketEntry(),
  Support.knowledgeBase => const KnowledgeBaseEntry(),
  Support.article => ArticleEntry(id as String),
  Admin.admin => const AdminEntry(),
  Admin.adminUsers => const AdminUsersEntry(),
  Admin.adminUser => AdminUserEntry(id as String),
  Admin.adminAuditLog => const AdminAuditLogEntry(),
  Admin.adminRole => AdminRoleEntry(id as String),
  Admin.adminFeatureFlags => const AdminFeatureFlagsEntry(),
  Admin.webhooks => const WebhooksEntry(),
  Admin.webhook => WebhookEntry(id as String),
  _ => throw StateError('not a _Screens screen'),
};

final class const Hop<N extends AnyNav>._(
  final Enum spec,
  final Object? id,
  final N nav,
) {
  /// The root-down chain this hop replays. A single kick-start is one
  /// segment; a navigable `Place` (a `Place`) overrides it with its
  /// full path, so `Screen.go` lands the whole placement.
  List<(Enum, Object?)> get chain => [(spec, id)];

  /// The screen this hop lands on — the total projection
  /// (the inverse needs an id, so it stays a Hop ctor).
  Screen<Object?> get screen => Screen._forSpec(spec);
  static const splash = Hop<SplashNav>._(_Screens.splash, null, SplashNav._());
  static const signIn = Hop<SignInNav>._(_Screens.signIn, null, SignInNav._());
  static const signUp = Hop<SignUpNav>._(_Screens.signUp, null, SignUpNav._());
  static const onboarding = Hop<OnboardingNav>._(
    _Screens.onboarding,
    null,
    OnboardingNav._(),
  );
  static const forgotPassword = Hop<ForgotPasswordNav>._(
    _Screens.forgotPassword,
    null,
    ForgotPasswordNav._(),
  );
  static Hop<ResetPasswordNav> resetPassword(String id) =>
      Hop._(_Screens.resetPassword, id, const ResetPasswordNav._());
  static const verifyEmail = Hop<VerifyEmailNav>._(
    _Screens.verifyEmail,
    null,
    VerifyEmailNav._(),
  );
  static const twoFactor = Hop<TwoFactorNav>._(
    _Screens.twoFactor,
    null,
    TwoFactorNav._(),
  );
  static const home = Hop<HomeNav>._(_Screens.home, null, HomeNav._());
  static const feed = Hop<FeedNav>._(_Screens.feed, null, FeedNav._());
  static const composePost = Hop<ComposePostNav>._(
    _Screens.composePost,
    null,
    ComposePostNav._(),
  );
  static Hop<StoryNav> story(String id) =>
      Hop._(_Screens.story, id, const StoryNav._());
  static Hop<PostNav> post(String id) =>
      Hop._(_Screens.post, id, const PostNav._());
  static const discover = Hop<DiscoverNav>._(
    _Screens.discover,
    null,
    DiscoverNav._(),
  );
  static const trending = Hop<TrendingNav>._(
    _Screens.trending,
    null,
    TrendingNav._(),
  );
  static const topics = Hop<TopicsNav>._(_Screens.topics, null, TopicsNav._());
  static Hop<TopicNav> topic(String id) =>
      Hop._(_Screens.topic, id, const TopicNav._());
  static Hop<HashtagNav> hashtag(String id) =>
      Hop._(_Screens.hashtag, id, const HashtagNav._());
  static const liveNow = Hop<LiveNowNav>._(
    _Screens.liveNow,
    null,
    LiveNowNav._(),
  );
  static Hop<LiveRoomNav> liveRoom(String id) =>
      Hop._(_Screens.liveRoom, id, const LiveRoomNav._());
  static const nearby = Hop<NearbyNav>._(_Screens.nearby, null, NearbyNav._());
  static const marketplace = Hop<MarketplaceNav>._(
    _Screens.marketplace,
    null,
    MarketplaceNav._(),
  );
  static const categories = Hop<CategoriesNav>._(
    _Screens.categories,
    null,
    CategoriesNav._(),
  );
  static Hop<CategoryNav> category(String id) =>
      Hop._(_Screens.category, id, const CategoryNav._());
  static const cart = Hop<CartNav>._(_Screens.cart, null, CartNav._());
  static Hop<CheckoutNav> checkout(String id) =>
      Hop._(_Screens.checkout, id, const CheckoutNav._());
  static const myOrders = Hop<MyOrdersNav>._(
    _Screens.myOrders,
    null,
    MyOrdersNav._(),
  );
  static Hop<OrderNav> order(String id) =>
      Hop._(_Screens.order, id, const OrderNav._());
  static const wishlist = Hop<WishlistNav>._(
    _Screens.wishlist,
    null,
    WishlistNav._(),
  );
  static const messages = Hop<MessagesNav>._(
    _Screens.messages,
    null,
    MessagesNav._(),
  );
  static const chats = Hop<ChatsNav>._(_Screens.chats, null, ChatsNav._());
  static Hop<ChatNav> chat(String id) =>
      Hop._(_Screens.chat, id, const ChatNav._());
  static const newChat = Hop<NewChatNav>._(
    _Screens.newChat,
    null,
    NewChatNav._(),
  );
  static Hop<GroupChatNav> groupChat(String id) =>
      Hop._(_Screens.groupChat, id, const GroupChatNav._());
  static const wallet = Hop<WalletNav>._(_Screens.wallet, null, WalletNav._());
  static const balance = Hop<BalanceNav>._(
    _Screens.balance,
    null,
    BalanceNav._(),
  );
  static const accounts = Hop<AccountsNav>._(
    _Screens.accounts,
    null,
    AccountsNav._(),
  );
  static Hop<AccountNav> account(String id) =>
      Hop._(_Screens.account, id, const AccountNav._());
  static const sendMoney = Hop<SendMoneyNav>._(
    _Screens.sendMoney,
    null,
    SendMoneyNav._(),
  );
  static const receiveMoney = Hop<ReceiveMoneyNav>._(
    _Screens.receiveMoney,
    null,
    ReceiveMoneyNav._(),
  );
  static const paymentMethods = Hop<PaymentMethodsNav>._(
    _Screens.paymentMethods,
    null,
    PaymentMethodsNav._(),
  );
  static const addCard = Hop<AddCardNav>._(
    _Screens.addCard,
    null,
    AddCardNav._(),
  );
  static Hop<CardNav> card(String id) =>
      Hop._(_Screens.card, id, const CardNav._());
  static const profile = Hop<ProfileNav>._(
    _Screens.profile,
    null,
    ProfileNav._(),
  );
  static Hop<FollowersNav> followers(String id) =>
      Hop._(_Screens.followers, id, const FollowersNav._());
  static Hop<FollowingNav> following(String id) =>
      Hop._(_Screens.following, id, const FollowingNav._());
  static const editProfile = Hop<EditProfileNav>._(
    _Screens.editProfile,
    null,
    EditProfileNav._(),
  );
  static const achievements = Hop<AchievementsNav>._(
    _Screens.achievements,
    null,
    AchievementsNav._(),
  );
  static const badges = Hop<BadgesNav>._(_Screens.badges, null, BadgesNav._());
  static Hop<BadgeNav> badge(String id) =>
      Hop._(_Screens.badge, id, const BadgeNav._());
  static const savedPosts = Hop<SavedPostsNav>._(
    _Screens.savedPosts,
    null,
    SavedPostsNav._(),
  );
  static const drafts = Hop<DraftsNav>._(_Screens.drafts, null, DraftsNav._());
  static const myListings = Hop<MyListingsNav>._(
    _Screens.myListings,
    null,
    MyListingsNav._(),
  );
  static const notifications = Hop<NotificationsNav>._(
    _Screens.notifications,
    null,
    NotificationsNav._(),
  );
  static const notificationSettings = Hop<NotificationSettingsNav>._(
    _Screens.notificationSettings,
    null,
    NotificationSettingsNav._(),
  );
  static const search = Hop<SearchNav>._(_Screens.search, null, SearchNav._());
  static const searchResults = Hop<SearchResultsNav>._(
    _Screens.searchResults,
    null,
    SearchResultsNav._(),
  );
  static const settings = Hop<SettingsNav>._(
    _Screens.settings,
    null,
    SettingsNav._(),
  );
  static const accountSettings = Hop<AccountSettingsNav>._(
    _Screens.accountSettings,
    null,
    AccountSettingsNav._(),
  );
  static const security = Hop<SecurityNav>._(
    _Screens.security,
    null,
    SecurityNav._(),
  );
  static const twoFactorSettings = Hop<TwoFactorSettingsNav>._(
    _Screens.twoFactorSettings,
    null,
    TwoFactorSettingsNav._(),
  );
  static const privacy = Hop<PrivacyNav>._(
    _Screens.privacy,
    null,
    PrivacyNav._(),
  );
  static const appearance = Hop<AppearanceNav>._(
    _Screens.appearance,
    null,
    AppearanceNav._(),
  );
  static const language = Hop<LanguageNav>._(
    _Screens.language,
    null,
    LanguageNav._(),
  );
  static const connectedApps = Hop<ConnectedAppsNav>._(
    _Screens.connectedApps,
    null,
    ConnectedAppsNav._(),
  );
  static const about = Hop<AboutNav>._(_Screens.about, null, AboutNav._());
  static const help = Hop<HelpNav>._(_Screens.help, null, HelpNav._());
  static Hop<HelpCategoryNav> helpCategory(String id) =>
      Hop._(_Screens.helpCategory, id, const HelpCategoryNav._());
  static const feedback = Hop<FeedbackNav>._(
    _Screens.feedback,
    null,
    FeedbackNav._(),
  );
  static const blockedUsers = Hop<BlockedUsersNav>._(
    _Screens.blockedUsers,
    null,
    BlockedUsersNav._(),
  );
  static const devices = Hop<DevicesNav>._(
    _Screens.devices,
    null,
    DevicesNav._(),
  );
  static Hop<DeviceNav> device(String id) =>
      Hop._(_Screens.device, id, const DeviceNav._());
  static const dataExport = Hop<DataExportNav>._(
    _Screens.dataExport,
    null,
    DataExportNav._(),
  );
  static const deleteAccount = Hop<DeleteAccountNav>._(
    _Screens.deleteAccount,
    null,
    DeleteAccountNav._(),
  );
  static const workspace = Hop<WorkspaceNav>._(
    _Screens.workspace,
    null,
    WorkspaceNav._(),
  );
  static Hop<ProjectNav> project(String id) =>
      Hop._(_Screens.project, id, const ProjectNav._());
  static const forum = Hop<ForumNav>._(_Screens.forum, null, ForumNav._());
  static Hop<ForumCategoryNav> forumCategory(String id) =>
      Hop._(_Screens.forumCategory, id, const ForumCategoryNav._());
  static const learn = Hop<LearnNav>._(_Screens.learn, null, LearnNav._());
  static Hop<CourseNav> course(String id) =>
      Hop._(_Screens.course, id, const CourseNav._());
  static const shop = Hop<ShopNav>._(_Screens.shop, null, ShopNav._());
  static Hop<ShopDeptNav> shopDept(String id) =>
      Hop._(_Screens.shopDept, id, const ShopDeptNav._());
  static const compareProducts = Hop<CompareProductsNav>._(
    _Screens.compareProducts,
    null,
    CompareProductsNav._(),
  );
  static const activity = Hop<ActivityNav>._(
    _Screens.activity,
    null,
    ActivityNav._(),
  );
  static Hop<WorkoutNav> workout(String id) =>
      Hop._(_Screens.workout, id, const WorkoutNav._());
  static const deepDemo = Hop<DeepDemoNav>._(
    _Screens.deepDemo,
    null,
    DeepDemoNav._(),
  );
  static Hop<LevelANav> levelA(String id) =>
      Hop._(_Screens.levelA, id, const LevelANav._());
  static const integrations = Hop<IntegrationsNav>._(
    _Screens.integrations,
    null,
    IntegrationsNav._(),
  );
  static const apiKeys = Hop<ApiKeysNav>._(
    _Screens.apiKeys,
    null,
    ApiKeysNav._(),
  );
  static const studio = Hop<StudioNav>._(
    CreatorStudio.studio,
    null,
    StudioNav._(),
  );
  static const analytics = Hop<AnalyticsNav>._(
    CreatorStudio.analytics,
    null,
    AnalyticsNav._(),
  );
  static const audience = Hop<AudienceNav>._(
    CreatorStudio.audience,
    null,
    AudienceNav._(),
  );
  static const scheduled = Hop<ScheduledNav>._(
    CreatorStudio.scheduled,
    null,
    ScheduledNav._(),
  );
  static Hop<ScheduledPostNav> scheduledPost(String id) =>
      Hop._(CreatorStudio.scheduledPost, id, const ScheduledPostNav._());
  static const monetization = Hop<MonetizationNav>._(
    CreatorStudio.monetization,
    null,
    MonetizationNav._(),
  );
  static const payouts = Hop<PayoutsNav>._(
    CreatorStudio.payouts,
    null,
    PayoutsNav._(),
  );
  static const events = Hop<EventsNav>._(Events.events, null, EventsNav._());
  static Hop<EventNav> event(String id) =>
      Hop._(Events.event, id, const EventNav._());
  static const createEvent = Hop<CreateEventNav>._(
    Events.createEvent,
    null,
    CreateEventNav._(),
  );
  static const support = Hop<SupportNav>._(
    Support.support,
    null,
    SupportNav._(),
  );
  static const supportTickets = Hop<SupportTicketsNav>._(
    Support.supportTickets,
    null,
    SupportTicketsNav._(),
  );
  static Hop<SupportTicketNav> supportTicket(String id) =>
      Hop._(Support.supportTicket, id, const SupportTicketNav._());
  static const newTicket = Hop<NewTicketNav>._(
    Support.newTicket,
    null,
    NewTicketNav._(),
  );
  static const knowledgeBase = Hop<KnowledgeBaseNav>._(
    Support.knowledgeBase,
    null,
    KnowledgeBaseNav._(),
  );
  static Hop<ArticleNav> article(String id) =>
      Hop._(Support.article, id, const ArticleNav._());
  static const admin = Hop<AdminNav>._(Admin.admin, null, AdminNav._());
  static const adminUsers = Hop<AdminUsersNav>._(
    Admin.adminUsers,
    null,
    AdminUsersNav._(),
  );
  static Hop<AdminUserNav> adminUser(String id) =>
      Hop._(Admin.adminUser, id, const AdminUserNav._());
  static const adminAuditLog = Hop<AdminAuditLogNav>._(
    Admin.adminAuditLog,
    null,
    AdminAuditLogNav._(),
  );
  static const adminFeatureFlags = Hop<AdminFeatureFlagsNav>._(
    Admin.adminFeatureFlags,
    null,
    AdminFeatureFlagsNav._(),
  );
  static const webhooks = Hop<WebhooksNav>._(
    Admin.webhooks,
    null,
    WebhooksNav._(),
  );
  static Hop<WebhookNav> webhook(String id) =>
      Hop._(Admin.webhook, id, const WebhookNav._());
}

final class const Root._() extends AnyPlacement {
  this : super._();
}

final class const On<N extends AnyNav>._(
  final List<Enum> specs,
  final List<Object?> ids,
  final N? nav,
) {
  static On<SplashNav> get splash =>
      On._([_Screens.splash], [null], const SplashNav._());
  static On<SignInNav> get signIn =>
      On._([_Screens.signIn], [null], const SignInNav._());
  static On<SignUpNav> get signUp =>
      On._([_Screens.signUp], [null], const SignUpNav._());
  static On<OnboardingNav> get onboarding =>
      On._([_Screens.onboarding], [null], const OnboardingNav._());
  static OnForgotPassword get forgotPassword => OnForgotPassword._(
    [_Screens.forgotPassword],
    [null],
    const ForgotPasswordNav._(),
  );
  static OnResetPassword get resetPassword => OnResetPassword._(
    [_Screens.resetPassword],
    [null],
    const ResetPasswordNav._(),
  );
  static On<VerifyEmailNav> get verifyEmail =>
      On._([_Screens.verifyEmail], [null], const VerifyEmailNav._());
  static On<TwoFactorNav> get twoFactor =>
      On._([_Screens.twoFactor], [null], const TwoFactorNav._());
  static OnHome get home =>
      OnHome._([_Screens.home], [null], const HomeNav._());
  static OnFeed get feed =>
      OnFeed._([_Screens.feed], [null], const FeedNav._());
  static On<ComposePostNav> get composePost =>
      On._([_Screens.composePost], [null], const ComposePostNav._());
  static OnStory get story =>
      OnStory._([_Screens.story], [null], const StoryNav._());
  static OnPost get post =>
      OnPost._([_Screens.post], [null], const PostNav._());
  static OnComment get comment =>
      OnComment._([_Screens.comment], [null], const CommentNav._());
  static OnPostAuthor get postAuthor =>
      OnPostAuthor._([_Screens.postAuthor], [null], const PostAuthorNav._());
  static OnPostComments get postComments => OnPostComments._(
    [_Screens.postComments],
    [null],
    const PostCommentsNav._(),
  );
  static OnPostLikes get postLikes =>
      OnPostLikes._([_Screens.postLikes], [null], const PostLikesNav._());
  static OnEditPost get editPost =>
      OnEditPost._([_Screens.editPost], [null], const EditPostNav._());
  static OnRepost get repost =>
      OnRepost._([_Screens.repost], [null], const RepostNav._());
  static OnDiscover get discover =>
      OnDiscover._([_Screens.discover], [null], const DiscoverNav._());
  static OnTrending get trending =>
      OnTrending._([_Screens.trending], [null], const TrendingNav._());
  static On<TopicsNav> get topics =>
      On._([_Screens.topics], [null], const TopicsNav._());
  static OnTopic get topic =>
      OnTopic._([_Screens.topic], [null], const TopicNav._());
  static OnSubtopic get subtopic =>
      OnSubtopic._([_Screens.subtopic], [null], const SubtopicNav._());
  static OnHashtag get hashtag =>
      OnHashtag._([_Screens.hashtag], [null], const HashtagNav._());
  static OnLiveNow get liveNow =>
      OnLiveNow._([_Screens.liveNow], [null], const LiveNowNav._());
  static OnLiveRoom get liveRoom =>
      OnLiveRoom._([_Screens.liveRoom], [null], const LiveRoomNav._());
  static On<NearbyNav> get nearby =>
      On._([_Screens.nearby], [null], const NearbyNav._());
  static OnMarketplace get marketplace =>
      OnMarketplace._([_Screens.marketplace], [null], const MarketplaceNav._());
  static OnCategories get categories =>
      OnCategories._([_Screens.categories], [null], const CategoriesNav._());
  static OnCategory get category =>
      OnCategory._([_Screens.category], [null], const CategoryNav._());
  static OnListing get listing =>
      OnListing._([_Screens.listing], [null], const ListingNav._());
  static OnListingVariant get listingVariant => OnListingVariant._(
    [_Screens.listingVariant],
    [null],
    const ListingVariantNav._(),
  );
  static OnEditListing get editListing =>
      OnEditListing._([_Screens.editListing], [null], const EditListingNav._());
  static OnSellerProfile get sellerProfile => OnSellerProfile._(
    [_Screens.sellerProfile],
    [null],
    const SellerProfileNav._(),
  );
  static OnCart get cart =>
      OnCart._([_Screens.cart], [null], const CartNav._());
  static OnCheckout get checkout =>
      OnCheckout._([_Screens.checkout], [null], const CheckoutNav._());
  static OnOrderConfirmation get orderConfirmation => OnOrderConfirmation._(
    [_Screens.orderConfirmation],
    [null],
    const OrderConfirmationNav._(),
  );
  static OnMyOrders get myOrders =>
      OnMyOrders._([_Screens.myOrders], [null], const MyOrdersNav._());
  static OnOrder get order =>
      OnOrder._([_Screens.order], [null], const OrderNav._());
  static On<WishlistNav> get wishlist =>
      On._([_Screens.wishlist], [null], const WishlistNav._());
  static OnMessages get messages =>
      OnMessages._([_Screens.messages], [null], const MessagesNav._());
  static OnChats get chats =>
      OnChats._([_Screens.chats], [null], const ChatsNav._());
  static OnChat get chat =>
      OnChat._([_Screens.chat], [null], const ChatNav._());
  static OnThread get thread =>
      OnThread._([_Screens.thread], [null], const ThreadNav._());
  static OnMessage get message =>
      OnMessage._([_Screens.message], [null], const MessageNav._());
  static OnMessageReply get messageReply => OnMessageReply._(
    [_Screens.messageReply],
    [null],
    const MessageReplyNav._(),
  );
  static OnVoiceCall get voiceCall =>
      OnVoiceCall._([_Screens.voiceCall], [null], const VoiceCallNav._());
  static On<NewChatNav> get newChat =>
      On._([_Screens.newChat], [null], const NewChatNav._());
  static OnGroupChat get groupChat =>
      OnGroupChat._([_Screens.groupChat], [null], const GroupChatNav._());
  static OnGroupInfo get groupInfo =>
      OnGroupInfo._([_Screens.groupInfo], [null], const GroupInfoNav._());
  static OnWallet get wallet =>
      OnWallet._([_Screens.wallet], [null], const WalletNav._());
  static On<BalanceNav> get balance =>
      On._([_Screens.balance], [null], const BalanceNav._());
  static OnAccounts get accounts =>
      OnAccounts._([_Screens.accounts], [null], const AccountsNav._());
  static OnAccount get account =>
      OnAccount._([_Screens.account], [null], const AccountNav._());
  static OnTransactions get transactions => OnTransactions._(
    [_Screens.transactions],
    [null],
    const TransactionsNav._(),
  );
  static OnTransaction get transaction =>
      OnTransaction._([_Screens.transaction], [null], const TransactionNav._());
  static OnTransactionItem get transactionItem => OnTransactionItem._(
    [_Screens.transactionItem],
    [null],
    const TransactionItemNav._(),
  );
  static On<SendMoneyNav> get sendMoney =>
      On._([_Screens.sendMoney], [null], const SendMoneyNav._());
  static On<ReceiveMoneyNav> get receiveMoney =>
      On._([_Screens.receiveMoney], [null], const ReceiveMoneyNav._());
  static OnPaymentMethods get paymentMethods => OnPaymentMethods._(
    [_Screens.paymentMethods],
    [null],
    const PaymentMethodsNav._(),
  );
  static On<AddCardNav> get addCard =>
      On._([_Screens.addCard], [null], const AddCardNav._());
  static OnCard get card =>
      OnCard._([_Screens.card], [null], const CardNav._());
  static OnStatements get statements =>
      OnStatements._([_Screens.statements], [null], const StatementsNav._());
  static OnStatement get statement =>
      OnStatement._([_Screens.statement], [null], const StatementNav._());
  static OnProfile get profile =>
      OnProfile._([_Screens.profile], [null], const ProfileNav._());
  static OnUserProfile get userProfile =>
      OnUserProfile._([_Screens.userProfile], [null], null);
  static OnFollowers get followers =>
      OnFollowers._([_Screens.followers], [null], const FollowersNav._());
  static OnFollowing get following =>
      OnFollowing._([_Screens.following], [null], const FollowingNav._());
  static OnConnection get connection =>
      OnConnection._([_Screens.connection], [null], const ConnectionNav._());
  static On<MutualConnectionsNav> get mutualConnections => On._(
    [_Screens.mutualConnections],
    [null],
    const MutualConnectionsNav._(),
  );
  static On<EditProfileNav> get editProfile =>
      On._([_Screens.editProfile], [null], const EditProfileNav._());
  static On<AchievementsNav> get achievements =>
      On._([_Screens.achievements], [null], const AchievementsNav._());
  static OnBadges get badges =>
      OnBadges._([_Screens.badges], [null], const BadgesNav._());
  static OnBadge get badge =>
      OnBadge._([_Screens.badge], [null], const BadgeNav._());
  static On<SavedPostsNav> get savedPosts =>
      On._([_Screens.savedPosts], [null], const SavedPostsNav._());
  static On<DraftsNav> get drafts =>
      On._([_Screens.drafts], [null], const DraftsNav._());
  static On<MyListingsNav> get myListings =>
      On._([_Screens.myListings], [null], const MyListingsNav._());
  static OnNotifications get notifications => OnNotifications._(
    [_Screens.notifications],
    [null],
    const NotificationsNav._(),
  );
  static On<NotificationSettingsNav> get notificationSettings => On._(
    [_Screens.notificationSettings],
    [null],
    const NotificationSettingsNav._(),
  );
  static OnSearch get search =>
      OnSearch._([_Screens.search], [null], const SearchNav._());
  static On<SearchResultsNav> get searchResults =>
      On._([_Screens.searchResults], [null], const SearchResultsNav._());
  static OnSettings get settings =>
      OnSettings._([_Screens.settings], [null], const SettingsNav._());
  static On<AccountSettingsNav> get accountSettings =>
      On._([_Screens.accountSettings], [null], const AccountSettingsNav._());
  static OnSecurity get security =>
      OnSecurity._([_Screens.security], [null], const SecurityNav._());
  static On<TwoFactorSettingsNav> get twoFactorSettings => On._(
    [_Screens.twoFactorSettings],
    [null],
    const TwoFactorSettingsNav._(),
  );
  static On<PrivacyNav> get privacy =>
      On._([_Screens.privacy], [null], const PrivacyNav._());
  static On<AppearanceNav> get appearance =>
      On._([_Screens.appearance], [null], const AppearanceNav._());
  static On<LanguageNav> get language =>
      On._([_Screens.language], [null], const LanguageNav._());
  static On<ConnectedAppsNav> get connectedApps =>
      On._([_Screens.connectedApps], [null], const ConnectedAppsNav._());
  static OnAbout get about =>
      OnAbout._([_Screens.about], [null], const AboutNav._());
  static OnHelp get help =>
      OnHelp._([_Screens.help], [null], const HelpNav._());
  static OnHelpCategory get helpCategory => OnHelpCategory._(
    [_Screens.helpCategory],
    [null],
    const HelpCategoryNav._(),
  );
  static OnFaq get faq => OnFaq._([_Screens.faq], [null], const FaqNav._());
  static OnFaqArticle get faqArticle =>
      OnFaqArticle._([_Screens.faqArticle], [null], const FaqArticleNav._());
  static On<FeedbackNav> get feedback =>
      On._([_Screens.feedback], [null], const FeedbackNav._());
  static On<BlockedUsersNav> get blockedUsers =>
      On._([_Screens.blockedUsers], [null], const BlockedUsersNav._());
  static OnDevices get devices =>
      OnDevices._([_Screens.devices], [null], const DevicesNav._());
  static OnDevice get device =>
      OnDevice._([_Screens.device], [null], const DeviceNav._());
  static On<SessionsNav> get sessions =>
      On._([_Screens.sessions], [null], const SessionsNav._());
  static OnSession get session =>
      OnSession._([_Screens.session], [null], const SessionNav._());
  static On<DataExportNav> get dataExport =>
      On._([_Screens.dataExport], [null], const DataExportNav._());
  static On<DeleteAccountNav> get deleteAccount =>
      On._([_Screens.deleteAccount], [null], const DeleteAccountNav._());
  static OnWorkspace get workspace =>
      OnWorkspace._([_Screens.workspace], [null], const WorkspaceNav._());
  static OnProject get project =>
      OnProject._([_Screens.project], [null], const ProjectNav._());
  static OnBoard get board =>
      OnBoard._([_Screens.board], [null], const BoardNav._());
  static OnTaskList get taskList =>
      OnTaskList._([_Screens.taskList], [null], const TaskListNav._());
  static OnTask get task =>
      OnTask._([_Screens.task], [null], const TaskNav._());
  static OnSubtask get subtask =>
      OnSubtask._([_Screens.subtask], [null], const SubtaskNav._());
  static OnChecklistItem get checklistItem => OnChecklistItem._(
    [_Screens.checklistItem],
    [null],
    const ChecklistItemNav._(),
  );
  static OnEditTask get editTask =>
      OnEditTask._([_Screens.editTask], [null], const EditTaskNav._());
  static OnTaskComment get taskComment =>
      OnTaskComment._([_Screens.taskComment], [null], const TaskCommentNav._());
  static OnAssignee get assignee =>
      OnAssignee._([_Screens.assignee], [null], const AssigneeNav._());
  static OnLabel get label =>
      OnLabel._([_Screens.label], [null], const LabelNav._());
  static OnMilestone get milestone =>
      OnMilestone._([_Screens.milestone], [null], const MilestoneNav._());
  static OnSprint get sprint =>
      OnSprint._([_Screens.sprint], [null], const SprintNav._());
  static OnForum get forum =>
      OnForum._([_Screens.forum], [null], const ForumNav._());
  static OnForumCategory get forumCategory => OnForumCategory._(
    [_Screens.forumCategory],
    [null],
    const ForumCategoryNav._(),
  );
  static OnForumThread get forumThread =>
      OnForumThread._([_Screens.forumThread], [null], const ForumThreadNav._());
  static OnForumReply get forumReply =>
      OnForumReply._([_Screens.forumReply], [null], const ForumReplyNav._());
  static OnReportThread get reportThread => OnReportThread._(
    [_Screens.reportThread],
    [null],
    const ReportThreadNav._(),
  );
  static OnLearn get learn =>
      OnLearn._([_Screens.learn], [null], const LearnNav._());
  static OnCourse get course =>
      OnCourse._([_Screens.course], [null], const CourseNav._());
  static OnCourseModule get courseModule => OnCourseModule._(
    [_Screens.courseModule],
    [null],
    const CourseModuleNav._(),
  );
  static OnLesson get lesson =>
      OnLesson._([_Screens.lesson], [null], const LessonNav._());
  static OnQuiz get quiz =>
      OnQuiz._([_Screens.quiz], [null], const QuizNav._());
  static OnQuestion get question =>
      OnQuestion._([_Screens.question], [null], const QuestionNav._());
  static OnAnswer get answer =>
      OnAnswer._([_Screens.answer], [null], const AnswerNav._());
  static OnCourseReview get courseReview => OnCourseReview._(
    [_Screens.courseReview],
    [null],
    const CourseReviewNav._(),
  );
  static OnInstructor get instructor =>
      OnInstructor._([_Screens.instructor], [null], const InstructorNav._());
  static OnCertificate get certificate =>
      OnCertificate._([_Screens.certificate], [null], const CertificateNav._());
  static OnShop get shop =>
      OnShop._([_Screens.shop], [null], const ShopNav._());
  static OnShopDept get shopDept =>
      OnShopDept._([_Screens.shopDept], [null], const ShopDeptNav._());
  static OnShopCategory get shopCategory => OnShopCategory._(
    [_Screens.shopCategory],
    [null],
    const ShopCategoryNav._(),
  );
  static OnShopSubcategory get shopSubcategory => OnShopSubcategory._(
    [_Screens.shopSubcategory],
    [null],
    const ShopSubcategoryNav._(),
  );
  static OnProduct get product =>
      OnProduct._([_Screens.product], [null], const ProductNav._());
  static OnProductVariant get productVariant => OnProductVariant._(
    [_Screens.productVariant],
    [null],
    const ProductVariantNav._(),
  );
  static OnProductReview get productReview => OnProductReview._(
    [_Screens.productReview],
    [null],
    const ProductReviewNav._(),
  );
  static OnBrand get brand =>
      OnBrand._([_Screens.brand], [null], const BrandNav._());
  static On<CompareProductsNav> get compareProducts =>
      On._([_Screens.compareProducts], [null], const CompareProductsNav._());
  static OnActivity get activity =>
      OnActivity._([_Screens.activity], [null], const ActivityNav._());
  static OnWorkout get workout =>
      OnWorkout._([_Screens.workout], [null], const WorkoutNav._());
  static OnExercise get exercise =>
      OnExercise._([_Screens.exercise], [null], const ExerciseNav._());
  static OnExerciseSet get exerciseSet =>
      OnExerciseSet._([_Screens.exerciseSet], [null], const ExerciseSetNav._());
  static OnDeepDemo get deepDemo =>
      OnDeepDemo._([_Screens.deepDemo], [null], const DeepDemoNav._());
  static OnLevelA get levelA =>
      OnLevelA._([_Screens.levelA], [null], const LevelANav._());
  static OnLevelB get levelB =>
      OnLevelB._([_Screens.levelB], [null], const LevelBNav._());
  static OnLevelC get levelC =>
      OnLevelC._([_Screens.levelC], [null], const LevelCNav._());
  static OnLevelD get levelD =>
      OnLevelD._([_Screens.levelD], [null], const LevelDNav._());
  static OnLevelE get levelE =>
      OnLevelE._([_Screens.levelE], [null], const LevelENav._());
  static OnLevelF get levelF =>
      OnLevelF._([_Screens.levelF], [null], const LevelFNav._());
  static OnIntegrations get integrations => OnIntegrations._(
    [_Screens.integrations],
    [null],
    const IntegrationsNav._(),
  );
  static On<ApiKeysNav> get apiKeys =>
      On._([_Screens.apiKeys], [null], const ApiKeysNav._());
  static OnStudio get studio =>
      OnStudio._([CreatorStudio.studio], [null], const StudioNav._());
  static OnAnalytics get analytics =>
      OnAnalytics._([CreatorStudio.analytics], [null], const AnalyticsNav._());
  static On<AudienceNav> get audience =>
      On._([CreatorStudio.audience], [null], const AudienceNav._());
  static OnScheduled get scheduled =>
      OnScheduled._([CreatorStudio.scheduled], [null], const ScheduledNav._());
  static OnScheduledPost get scheduledPost => OnScheduledPost._(
    [CreatorStudio.scheduledPost],
    [null],
    const ScheduledPostNav._(),
  );
  static OnEditScheduled get editScheduled => OnEditScheduled._(
    [CreatorStudio.editScheduled],
    [null],
    const EditScheduledNav._(),
  );
  static OnMonetization get monetization => OnMonetization._(
    [CreatorStudio.monetization],
    [null],
    const MonetizationNav._(),
  );
  static On<PayoutsNav> get payouts =>
      On._([CreatorStudio.payouts], [null], const PayoutsNav._());
  static OnEvents get events =>
      OnEvents._([Events.events], [null], const EventsNav._());
  static OnEvent get event =>
      OnEvent._([Events.event], [null], const EventNav._());
  static OnAttendees get attendees =>
      OnAttendees._([Events.attendees], [null], const AttendeesNav._());
  static OnEditEvent get editEvent =>
      OnEditEvent._([Events.editEvent], [null], const EditEventNav._());
  static On<CreateEventNav> get createEvent =>
      On._([Events.createEvent], [null], const CreateEventNav._());
  static OnTickets get tickets =>
      OnTickets._([Events.tickets], [null], const TicketsNav._());
  static OnSupport get support =>
      OnSupport._([Support.support], [null], const SupportNav._());
  static OnSupportTickets get supportTickets => OnSupportTickets._(
    [Support.supportTickets],
    [null],
    const SupportTicketsNav._(),
  );
  static OnSupportTicket get supportTicket => OnSupportTicket._(
    [Support.supportTicket],
    [null],
    const SupportTicketNav._(),
  );
  static On<NewTicketNav> get newTicket =>
      On._([Support.newTicket], [null], const NewTicketNav._());
  static OnKnowledgeBase get knowledgeBase => OnKnowledgeBase._(
    [Support.knowledgeBase],
    [null],
    const KnowledgeBaseNav._(),
  );
  static OnArticle get article =>
      OnArticle._([Support.article], [null], const ArticleNav._());
  static OnAdmin get admin =>
      OnAdmin._([Admin.admin], [null], const AdminNav._());
  static OnAdminUsers get adminUsers =>
      OnAdminUsers._([Admin.adminUsers], [null], const AdminUsersNav._());
  static OnAdminUser get adminUser =>
      OnAdminUser._([Admin.adminUser], [null], const AdminUserNav._());
  static On<AdminAuditLogNav> get adminAuditLog =>
      On._([Admin.adminAuditLog], [null], const AdminAuditLogNav._());
  static OnAdminRole get adminRole =>
      OnAdminRole._([Admin.adminRole], [null], const AdminRoleNav._());
  static On<AdminFeatureFlagsNav> get adminFeatureFlags =>
      On._([Admin.adminFeatureFlags], [null], const AdminFeatureFlagsNav._());
  static OnWebhooks get webhooks =>
      OnWebhooks._([Admin.webhooks], [null], const WebhooksNav._());
  static OnWebhook get webhook =>
      OnWebhook._([Admin.webhook], [null], const WebhookNav._());

  /// Disambiguating push onto the current scope when a screen has
  /// 2+ parents: `Screen.on(.parentOf.x)?.goX(...)`. A namespace —
  /// `.parentOf` alone is not an `On`, so the bare form will not compile.
  static _ParentSel get parentOf => const _ParentSel._();
}

final class const OnParentOf<N extends AnyNav>._(
  final Set<_Screens> parents,
  N nav,
  final N Function(Enum) at,
) extends On<N> {
  this : super._(const [], const [], nav);
}

final class const _ParentSel._() {
  OnParentOf<StoryNavParent> get story => OnParentOf._(
    const {.feed, .story},
    const StoryNavParent._(),
    StoryNavParent._,
  );
  OnParentOf<PostNavParent> get post => OnParentOf._(
    const {.comment, .feed, .post, .postAuthor},
    const PostNavParent._(),
    PostNavParent._,
  );
  OnParentOf<CommentNavParent> get comment => OnParentOf._(
    const {.comment, .post},
    const CommentNavParent._(),
    CommentNavParent._,
  );
  OnParentOf<PostAuthorNavParent> get postAuthor => OnParentOf._(
    const {.post, .postAuthor},
    const PostAuthorNavParent._(),
    PostAuthorNavParent._,
  );
  OnParentOf<TopicNavParent> get topic => OnParentOf._(
    const {.subtopic, .topic, .trending},
    const TopicNavParent._(),
    TopicNavParent._,
  );
  OnParentOf<SubtopicNavParent> get subtopic => OnParentOf._(
    const {.subtopic, .topic},
    const SubtopicNavParent._(),
    SubtopicNavParent._,
  );
  OnParentOf<HashtagNavParent> get hashtag => OnParentOf._(
    const {.hashtag, .trending},
    const HashtagNavParent._(),
    HashtagNavParent._,
  );
  OnParentOf<LiveRoomNavParent> get liveRoom => OnParentOf._(
    const {.liveNow, .liveRoom},
    const LiveRoomNavParent._(),
    LiveRoomNavParent._,
  );
  OnParentOf<CategoryNavParent> get category => OnParentOf._(
    const {.categories, .category},
    const CategoryNavParent._(),
    CategoryNavParent._,
  );
  OnParentOf<ListingNavParent> get listing => OnParentOf._(
    const {.category, .listing, .sellerProfile},
    const ListingNavParent._(),
    ListingNavParent._,
  );
  OnParentOf<ListingVariantNavParent> get listingVariant => OnParentOf._(
    const {.listing, .listingVariant},
    const ListingVariantNavParent._(),
    ListingVariantNavParent._,
  );
  OnParentOf<SellerProfileNavParent> get sellerProfile => OnParentOf._(
    const {.listing, .sellerProfile},
    const SellerProfileNavParent._(),
    SellerProfileNavParent._,
  );
  OnParentOf<OrderNavParent> get order => OnParentOf._(
    const {.myOrders, .order},
    const OrderNavParent._(),
    OrderNavParent._,
  );
  OnParentOf<ChatNavParent> get chat => OnParentOf._(
    const {.chats, .message},
    const ChatNavParent._(),
    ChatNavParent._,
  );
  OnParentOf<ThreadNavParent> get thread => OnParentOf._(
    const {.chat, .thread},
    const ThreadNavParent._(),
    ThreadNavParent._,
  );
  OnParentOf<MessageReplyNavParent> get messageReply => OnParentOf._(
    const {.message, .messageReply},
    const MessageReplyNavParent._(),
    MessageReplyNavParent._,
  );
  OnParentOf<GroupChatNavParent> get groupChat => OnParentOf._(
    const {.groupChat, .messages},
    const GroupChatNavParent._(),
    GroupChatNavParent._,
  );
  OnParentOf<AccountNavParent> get account => OnParentOf._(
    const {.account, .accounts},
    const AccountNavParent._(),
    AccountNavParent._,
  );
  OnParentOf<TransactionNavParent> get transaction => OnParentOf._(
    const {.transaction, .transactions},
    const TransactionNavParent._(),
    TransactionNavParent._,
  );
  OnParentOf<TransactionItemNavParent> get transactionItem => OnParentOf._(
    const {.transaction, .transactionItem},
    const TransactionItemNavParent._(),
    TransactionItemNavParent._,
  );
  OnParentOf<UserProfileNavParent> get userProfile => OnParentOf._(
    const {.chat, .feed, .forumReply, .profile, .project, .trending},
    const UserProfileNavParent._(),
    UserProfileNavParent._,
  );
  OnParentOf<ConnectionNavParent> get connection => OnParentOf._(
    const {.connection, .followers},
    const ConnectionNavParent._(),
    ConnectionNavParent._,
  );
  OnParentOf<BadgeNavParent> get badge => OnParentOf._(
    const {.badge, .badges},
    const BadgeNavParent._(),
    BadgeNavParent._,
  );
  OnParentOf<SessionNavParent> get session => OnParentOf._(
    const {.device, .session},
    const SessionNavParent._(),
    SessionNavParent._,
  );
  OnParentOf<TaskNavParent> get task => OnParentOf._(
    const {.task, .taskList},
    const TaskNavParent._(),
    TaskNavParent._,
  );
  OnParentOf<SubtaskNavParent> get subtask => OnParentOf._(
    const {.subtask, .task},
    const SubtaskNavParent._(),
    SubtaskNavParent._,
  );
  OnParentOf<ChecklistItemNavParent> get checklistItem => OnParentOf._(
    const {.checklistItem, .subtask},
    const ChecklistItemNavParent._(),
    ChecklistItemNavParent._,
  );
  OnParentOf<ForumThreadNavParent> get forumThread => OnParentOf._(
    const {.forumCategory, .forumThread},
    const ForumThreadNavParent._(),
    ForumThreadNavParent._,
  );
  OnParentOf<ForumReplyNavParent> get forumReply => OnParentOf._(
    const {.forumReply, .forumThread},
    const ForumReplyNavParent._(),
    ForumReplyNavParent._,
  );
  OnParentOf<QuestionNavParent> get question => OnParentOf._(
    const {.question, .quiz},
    const QuestionNavParent._(),
    QuestionNavParent._,
  );
  OnParentOf<ProductNavParent> get product => OnParentOf._(
    const {.product, .shopSubcategory},
    const ProductNavParent._(),
    ProductNavParent._,
  );
  OnParentOf<ProductVariantNavParent> get productVariant => OnParentOf._(
    const {.product, .productVariant},
    const ProductVariantNavParent._(),
    ProductVariantNavParent._,
  );
  OnParentOf<ExerciseSetNavParent> get exerciseSet => OnParentOf._(
    const {.exercise, .exerciseSet},
    const ExerciseSetNavParent._(),
    ExerciseSetNavParent._,
  );
  OnParentOf<LevelANavParent> get levelA => OnParentOf._(
    const {.deepDemo, .levelF},
    const LevelANavParent._(),
    LevelANavParent._,
  );
  OnParentOf<LevelBNavParent> get levelB => OnParentOf._(
    const {.levelA, .levelF},
    const LevelBNavParent._(),
    LevelBNavParent._,
  );
  OnParentOf<LevelCNavParent> get levelC => OnParentOf._(
    const {.levelB, .levelF},
    const LevelCNavParent._(),
    LevelCNavParent._,
  );
  OnParentOf<LevelDNavParent> get levelD => OnParentOf._(
    const {.levelC, .levelF},
    const LevelDNavParent._(),
    LevelDNavParent._,
  );
  OnParentOf<LevelENavParent> get levelE => OnParentOf._(
    const {.levelD, .levelF},
    const LevelENavParent._(),
    LevelENavParent._,
  );
  OnParentOf<LevelFNavParent> get levelF => OnParentOf._(
    const {.levelE, .levelF},
    const LevelFNavParent._(),
    LevelFNavParent._,
  );
}

final class const StoryNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goStory(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.story, id);
    } else {
      _Screens.graph.go(_Screens.story, id, true);
    }
  }
}

final class const PostNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goPost(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.post, id);
    } else {
      _Screens.graph.go(_Screens.post, id, true);
    }
  }
}

final class const CommentNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goComment(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.comment, id);
    } else {
      _Screens.graph.go(_Screens.comment, id, true);
    }
  }

  void goPost(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.post, id);
    } else {
      _Screens.graph.go(_Screens.post, id, true);
    }
  }
}

final class const PostAuthorNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goPost(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.post, id);
    } else {
      _Screens.graph.go(_Screens.post, id, true);
    }
  }

  void goPostAuthor(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.postAuthor, id);
    } else {
      _Screens.graph.go(_Screens.postAuthor, id, true);
    }
  }
}

final class const TopicNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goTopic(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.topic, id);
    } else {
      _Screens.graph.go(_Screens.topic, id, true);
    }
  }
}

final class const SubtopicNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goSubtopic(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.subtopic, id);
    } else {
      _Screens.graph.go(_Screens.subtopic, id, true);
    }
  }

  void goTopic(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.topic, id);
    } else {
      _Screens.graph.go(_Screens.topic, id, true);
    }
  }
}

final class const HashtagNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goHashtag(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.hashtag, id);
    } else {
      _Screens.graph.go(_Screens.hashtag, id, true);
    }
  }
}

final class const LiveRoomNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goLiveRoom(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.liveRoom, id);
    } else {
      _Screens.graph.go(_Screens.liveRoom, id, true);
    }
  }
}

final class const CategoryNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goCategory(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.category, id);
    } else {
      _Screens.graph.go(_Screens.category, id, true);
    }
  }
}

final class const ListingNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goListing(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.listing, id);
    } else {
      _Screens.graph.go(_Screens.listing, id, true);
    }
  }
}

final class const ListingVariantNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goListingVariant(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.listingVariant, id);
    } else {
      _Screens.graph.go(_Screens.listingVariant, id, true);
    }
  }
}

final class const SellerProfileNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goListing(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.listing, id);
    } else {
      _Screens.graph.go(_Screens.listing, id, true);
    }
  }

  void goSellerProfile(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.sellerProfile, id);
    } else {
      _Screens.graph.go(_Screens.sellerProfile, id, true);
    }
  }
}

final class const OrderNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goOrder(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.order, id);
    } else {
      _Screens.graph.go(_Screens.order, id, true);
    }
  }
}

final class const ChatNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goChat(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.chat, id);
    } else {
      _Screens.graph.go(_Screens.chat, id, true);
    }
  }
}

final class const ThreadNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goThread(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.thread, id);
    } else {
      _Screens.graph.go(_Screens.thread, id, true);
    }
  }
}

final class const MessageReplyNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goMessageReply(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.messageReply, id);
    } else {
      _Screens.graph.go(_Screens.messageReply, id, true);
    }
  }
}

final class const GroupChatNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goGroupChat(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.groupChat, id);
    } else {
      _Screens.graph.go(_Screens.groupChat, id, true);
    }
  }
}

final class const AccountNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goAccount(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.account, id);
    } else {
      _Screens.graph.go(_Screens.account, id, true);
    }
  }
}

final class const TransactionNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goTransaction(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.transaction, id);
    } else {
      _Screens.graph.go(_Screens.transaction, id, true);
    }
  }
}

final class const TransactionItemNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goTransactionItem(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.transactionItem, id);
    } else {
      _Screens.graph.go(_Screens.transactionItem, id, true);
    }
  }
}

final class const UserProfileNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goUserProfile(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.userProfile, id);
    } else {
      _Screens.graph.go(_Screens.userProfile, id, true);
    }
  }
}

final class const ConnectionNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goConnection(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.connection, id);
    } else {
      _Screens.graph.go(_Screens.connection, id, true);
    }
  }
}

final class const BadgeNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goBadge(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.badge, id);
    } else {
      _Screens.graph.go(_Screens.badge, id, true);
    }
  }
}

final class const SessionNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goSession(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.session, id);
    } else {
      _Screens.graph.go(_Screens.session, id, true);
    }
  }
}

final class const TaskNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goTask(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.task, id);
    } else {
      _Screens.graph.go(_Screens.task, id, true);
    }
  }
}

final class const SubtaskNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goSubtask(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.subtask, id);
    } else {
      _Screens.graph.go(_Screens.subtask, id, true);
    }
  }
}

final class const ChecklistItemNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goChecklistItem(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.checklistItem, id);
    } else {
      _Screens.graph.go(_Screens.checklistItem, id, true);
    }
  }
}

final class const ForumThreadNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goForumThread(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.forumThread, id);
    } else {
      _Screens.graph.go(_Screens.forumThread, id, true);
    }
  }
}

final class const ForumReplyNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goForumReply(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.forumReply, id);
    } else {
      _Screens.graph.go(_Screens.forumReply, id, true);
    }
  }
}

final class const QuestionNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goQuestion(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.question, id);
    } else {
      _Screens.graph.go(_Screens.question, id, true);
    }
  }
}

final class const ProductNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goProduct(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.product, id);
    } else {
      _Screens.graph.go(_Screens.product, id, true);
    }
  }
}

final class const ProductVariantNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goProductVariant(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.productVariant, id);
    } else {
      _Screens.graph.go(_Screens.productVariant, id, true);
    }
  }
}

final class const ExerciseSetNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goExerciseSet(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.exerciseSet, id);
    } else {
      _Screens.graph.go(_Screens.exerciseSet, id, true);
    }
  }
}

final class const LevelANavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goLevelA(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.levelA, id);
    } else {
      _Screens.graph.go(_Screens.levelA, id, true);
    }
  }
}

final class const LevelBNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goLevelB(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.levelB, id);
    } else {
      _Screens.graph.go(_Screens.levelB, id, true);
    }
  }
}

final class const LevelCNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goLevelC(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.levelC, id);
    } else {
      _Screens.graph.go(_Screens.levelC, id, true);
    }
  }
}

final class const LevelDNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goLevelD(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.levelD, id);
    } else {
      _Screens.graph.go(_Screens.levelD, id, true);
    }
  }
}

final class const LevelENavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goLevelE(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.levelE, id);
    } else {
      _Screens.graph.go(_Screens.levelE, id, true);
    }
  }
}

final class const LevelFNavParent._([final Enum? _at]) extends AnyNav {
  this : super._();
  void goLevelF(String id) {
    if (_at case final at?) {
      _Screens.graph.goFrom(at, _Screens.levelF, id);
    } else {
      _Screens.graph.go(_Screens.levelF, id, true);
    }
  }
}

final class const OnForgotPassword._(super.specs, super.ids, super.nav)
    extends On<ForgotPasswordNav> {
  this : super._();
  OnResetPassword get resetPassword => OnResetPassword._(
    [...specs, _Screens.resetPassword],
    [...ids, null],
    const ResetPasswordNav._(),
  );
}

final class const OnResetPassword._(super.specs, super.ids, super.nav)
    extends On<ResetPasswordNav> {
  this : super._();
  OnResetPassword call(String id) =>
      OnResetPassword._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnHome._(super.specs, super.ids, super.nav)
    extends On<HomeNav> {
  this : super._();
  OnFeed get feed =>
      OnFeed._([...specs, _Screens.feed], [...ids, null], const FeedNav._());
  OnStudio get studio => OnStudio._(
    [...specs, CreatorStudio.studio],
    [...ids, null],
    const StudioNav._(),
  );
}

final class const OnFeed._(super.specs, super.ids, super.nav)
    extends On<FeedNav> {
  this : super._();
  OnPost get post =>
      OnPost._([...specs, _Screens.post], [...ids, null], const PostNav._());
  OnStory get story =>
      OnStory._([...specs, _Screens.story], [...ids, null], const StoryNav._());
  On<ComposePostNav> get composePost => On._(
    [...specs, _Screens.composePost],
    [...ids, null],
    const ComposePostNav._(),
  );
  OnUserProfile1 get userProfile => OnUserProfile1._(
    [...specs, _Screens.userProfile],
    [...ids, null],
    const UserProfileNav1._(),
  );
}

final class const OnPost._(super.specs, super.ids, super.nav)
    extends On<PostNav> {
  this : super._();
  OnComment get comment => OnComment._(
    [...specs, _Screens.comment],
    [...ids, null],
    const CommentNav._(),
  );
  OnPostAuthor get postAuthor => OnPostAuthor._(
    [...specs, _Screens.postAuthor],
    [...ids, null],
    const PostAuthorNav._(),
  );
  OnPost call(String id) =>
      OnPost._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnComment._(super.specs, super.ids, super.nav)
    extends On<CommentNav> {
  this : super._();
  OnComment call(String id) =>
      OnComment._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnPostAuthor._(super.specs, super.ids, super.nav)
    extends On<PostAuthorNav> {
  this : super._();
  OnPostAuthor call(String id) =>
      OnPostAuthor._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnStory._(super.specs, super.ids, super.nav)
    extends On<StoryNav> {
  this : super._();
  OnStory call(String id) =>
      OnStory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnUserProfile1._(super.specs, super.ids, super.nav)
    extends On<UserProfileNav1> {
  this : super._();
  OnUserProfile1 call(String id) =>
      OnUserProfile1._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnStudio._(super.specs, super.ids, super.nav)
    extends On<StudioNav> {
  this : super._();
  OnAnalytics get analytics => OnAnalytics._(
    [...specs, CreatorStudio.analytics],
    [...ids, null],
    const AnalyticsNav._(),
  );
  OnScheduled get scheduled => OnScheduled._(
    [...specs, CreatorStudio.scheduled],
    [...ids, null],
    const ScheduledNav._(),
  );
  OnMonetization get monetization => OnMonetization._(
    [...specs, CreatorStudio.monetization],
    [...ids, null],
    const MonetizationNav._(),
  );
}

final class const OnAnalytics._(super.specs, super.ids, super.nav)
    extends On<AnalyticsNav> {
  this : super._();
  On<AudienceNav> get audience => On._(
    [...specs, CreatorStudio.audience],
    [...ids, null],
    const AudienceNav._(),
  );
}

final class const OnScheduled._(super.specs, super.ids, super.nav)
    extends On<ScheduledNav> {
  this : super._();
  OnScheduledPost get scheduledPost => OnScheduledPost._(
    [...specs, CreatorStudio.scheduledPost],
    [...ids, null],
    const ScheduledPostNav._(),
  );
}

final class const OnScheduledPost._(super.specs, super.ids, super.nav)
    extends On<ScheduledPostNav> {
  this : super._();
  OnScheduledPost call(String id) =>
      OnScheduledPost._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnMonetization._(super.specs, super.ids, super.nav)
    extends On<MonetizationNav> {
  this : super._();
  On<PayoutsNav> get payouts => On._(
    [...specs, CreatorStudio.payouts],
    [...ids, null],
    const PayoutsNav._(),
  );
}

final class const OnPostComments._(super.specs, super.ids, super.nav)
    extends On<PostCommentsNav> {
  this : super._();
  OnPostComments call(String id) =>
      OnPostComments._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnPostLikes._(super.specs, super.ids, super.nav)
    extends On<PostLikesNav> {
  this : super._();
  OnPostLikes call(String id) =>
      OnPostLikes._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnEditPost._(super.specs, super.ids, super.nav)
    extends On<EditPostNav> {
  this : super._();
  OnEditPost call(String id) =>
      OnEditPost._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnRepost._(super.specs, super.ids, super.nav)
    extends On<RepostNav> {
  this : super._();
  OnRepost call(String id) =>
      OnRepost._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnDiscover._(super.specs, super.ids, super.nav)
    extends On<DiscoverNav> {
  this : super._();
  OnTrending get trending => OnTrending._(
    [...specs, _Screens.trending],
    [...ids, null],
    const TrendingNav._(),
  );
  On<TopicsNav> get topics =>
      On._([...specs, _Screens.topics], [...ids, null], const TopicsNav._());
  OnLiveNow get liveNow => OnLiveNow._(
    [...specs, _Screens.liveNow],
    [...ids, null],
    const LiveNowNav._(),
  );
  On<NearbyNav> get nearby =>
      On._([...specs, _Screens.nearby], [...ids, null], const NearbyNav._());
  OnEvents get events => OnEvents._(
    [...specs, Events.events],
    [...ids, null],
    const EventsNav._(),
  );
}

final class const OnTrending._(super.specs, super.ids, super.nav)
    extends On<TrendingNav> {
  this : super._();
  OnHashtag get hashtag => OnHashtag._(
    [...specs, _Screens.hashtag],
    [...ids, null],
    const HashtagNav._(),
  );
  OnTopic get topic =>
      OnTopic._([...specs, _Screens.topic], [...ids, null], const TopicNav._());
  OnUserProfile2 get userProfile => OnUserProfile2._(
    [...specs, _Screens.userProfile],
    [...ids, null],
    const UserProfileNav2._(),
  );
}

final class const OnHashtag._(super.specs, super.ids, super.nav)
    extends On<HashtagNav> {
  this : super._();
  OnHashtag call(String id) =>
      OnHashtag._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnTopic._(super.specs, super.ids, super.nav)
    extends On<TopicNav> {
  this : super._();
  OnSubtopic get subtopic => OnSubtopic._(
    [...specs, _Screens.subtopic],
    [...ids, null],
    const SubtopicNav._(),
  );
  OnTopic call(String id) =>
      OnTopic._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSubtopic._(super.specs, super.ids, super.nav)
    extends On<SubtopicNav> {
  this : super._();
  OnSubtopic call(String id) =>
      OnSubtopic._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnUserProfile2._(super.specs, super.ids, super.nav)
    extends On<UserProfileNav2> {
  this : super._();
  OnUserProfile2 call(String id) =>
      OnUserProfile2._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnLiveNow._(super.specs, super.ids, super.nav)
    extends On<LiveNowNav> {
  this : super._();
  OnLiveRoom get liveRoom => OnLiveRoom._(
    [...specs, _Screens.liveRoom],
    [...ids, null],
    const LiveRoomNav._(),
  );
}

final class const OnLiveRoom._(super.specs, super.ids, super.nav)
    extends On<LiveRoomNav> {
  this : super._();
  OnLiveRoom call(String id) =>
      OnLiveRoom._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnEvents._(super.specs, super.ids, super.nav)
    extends On<EventsNav> {
  this : super._();
  OnEvent get event =>
      OnEvent._([...specs, Events.event], [...ids, null], const EventNav._());
  On<CreateEventNav> get createEvent => On._(
    [...specs, Events.createEvent],
    [...ids, null],
    const CreateEventNav._(),
  );
}

final class const OnEvent._(super.specs, super.ids, super.nav)
    extends On<EventNav> {
  this : super._();
  OnEvent call(String id) =>
      OnEvent._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnMarketplace._(super.specs, super.ids, super.nav)
    extends On<MarketplaceNav> {
  this : super._();
  OnCategories get categories => OnCategories._(
    [...specs, _Screens.categories],
    [...ids, null],
    const CategoriesNav._(),
  );
  OnCart get cart =>
      OnCart._([...specs, _Screens.cart], [...ids, null], const CartNav._());
  OnMyOrders get myOrders => OnMyOrders._(
    [...specs, _Screens.myOrders],
    [...ids, null],
    const MyOrdersNav._(),
  );
  On<WishlistNav> get wishlist => On._(
    [...specs, _Screens.wishlist],
    [...ids, null],
    const WishlistNav._(),
  );
}

final class const OnCategories._(super.specs, super.ids, super.nav)
    extends On<CategoriesNav> {
  this : super._();
  OnCategory get category => OnCategory._(
    [...specs, _Screens.category],
    [...ids, null],
    const CategoryNav._(),
  );
}

final class const OnCategory._(super.specs, super.ids, super.nav)
    extends On<CategoryNav> {
  this : super._();
  OnListing get listing => OnListing._(
    [...specs, _Screens.listing],
    [...ids, null],
    const ListingNav._(),
  );
  OnCategory call(String id) =>
      OnCategory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnListing._(super.specs, super.ids, super.nav)
    extends On<ListingNav> {
  this : super._();
  OnSellerProfile get sellerProfile => OnSellerProfile._(
    [...specs, _Screens.sellerProfile],
    [...ids, null],
    const SellerProfileNav._(),
  );
  OnListingVariant get listingVariant => OnListingVariant._(
    [...specs, _Screens.listingVariant],
    [...ids, null],
    const ListingVariantNav._(),
  );
  OnListing call(String id) =>
      OnListing._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSellerProfile._(super.specs, super.ids, super.nav)
    extends On<SellerProfileNav> {
  this : super._();
  OnSellerProfile call(String id) =>
      OnSellerProfile._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnListingVariant._(super.specs, super.ids, super.nav)
    extends On<ListingVariantNav> {
  this : super._();
  OnListingVariant call(String id) =>
      OnListingVariant._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnCart._(super.specs, super.ids, super.nav)
    extends On<CartNav> {
  this : super._();
  OnCheckout get checkout => OnCheckout._(
    [...specs, _Screens.checkout],
    [...ids, null],
    const CheckoutNav._(),
  );
}

final class const OnCheckout._(super.specs, super.ids, super.nav)
    extends On<CheckoutNav> {
  this : super._();
  OnOrderConfirmation get orderConfirmation => OnOrderConfirmation._(
    [...specs, _Screens.orderConfirmation],
    [...ids, null],
    const OrderConfirmationNav._(),
  );
  OnCheckout call(String id) =>
      OnCheckout._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnOrderConfirmation._(super.specs, super.ids, super.nav)
    extends On<OrderConfirmationNav> {
  this : super._();
  OnOrderConfirmation call(String id) => OnOrderConfirmation._(specs, [
    ...ids.sublist(0, ids.length - 1),
    id,
  ], nav);
}

final class const OnMyOrders._(super.specs, super.ids, super.nav)
    extends On<MyOrdersNav> {
  this : super._();
  OnOrder get order =>
      OnOrder._([...specs, _Screens.order], [...ids, null], const OrderNav._());
}

final class const OnOrder._(super.specs, super.ids, super.nav)
    extends On<OrderNav> {
  this : super._();
  OnOrder call(String id) =>
      OnOrder._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnEditListing._(super.specs, super.ids, super.nav)
    extends On<EditListingNav> {
  this : super._();
  OnEditListing call(String id) =>
      OnEditListing._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnMessages._(super.specs, super.ids, super.nav)
    extends On<MessagesNav> {
  this : super._();
  OnChats get chats =>
      OnChats._([...specs, _Screens.chats], [...ids, null], const ChatsNav._());
  On<NewChatNav> get newChat =>
      On._([...specs, _Screens.newChat], [...ids, null], const NewChatNav._());
  OnGroupChat get groupChat => OnGroupChat._(
    [...specs, _Screens.groupChat],
    [...ids, null],
    const GroupChatNav._(),
  );
}

final class const OnChats._(super.specs, super.ids, super.nav)
    extends On<ChatsNav> {
  this : super._();
  OnChat get chat =>
      OnChat._([...specs, _Screens.chat], [...ids, null], const ChatNav._());
}

final class const OnChat._(super.specs, super.ids, super.nav)
    extends On<ChatNav> {
  this : super._();
  OnThread get thread => OnThread._(
    [...specs, _Screens.thread],
    [...ids, null],
    const ThreadNav._(),
  );
  OnUserProfile3 get userProfile => OnUserProfile3._(
    [...specs, _Screens.userProfile],
    [...ids, null],
    const UserProfileNav3._(),
  );
  OnChat call(String id) =>
      OnChat._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnThread._(super.specs, super.ids, super.nav)
    extends On<ThreadNav> {
  this : super._();
  OnMessage get message => OnMessage._(
    [...specs, _Screens.message],
    [...ids, null],
    const MessageNav._(),
  );
  OnThread call(String id) =>
      OnThread._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnMessage._(super.specs, super.ids, super.nav)
    extends On<MessageNav> {
  this : super._();
  OnMessageReply get messageReply => OnMessageReply._(
    [...specs, _Screens.messageReply],
    [...ids, null],
    const MessageReplyNav._(),
  );
  OnMessage call(String id) =>
      OnMessage._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnMessageReply._(super.specs, super.ids, super.nav)
    extends On<MessageReplyNav> {
  this : super._();
  OnMessageReply call(String id) =>
      OnMessageReply._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnUserProfile3._(super.specs, super.ids, super.nav)
    extends On<UserProfileNav3> {
  this : super._();
  OnUserProfile3 call(String id) =>
      OnUserProfile3._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnGroupChat._(super.specs, super.ids, super.nav)
    extends On<GroupChatNav> {
  this : super._();
  OnGroupChat call(String id) =>
      OnGroupChat._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnVoiceCall._(super.specs, super.ids, super.nav)
    extends On<VoiceCallNav> {
  this : super._();
  OnVoiceCall call(String id) =>
      OnVoiceCall._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnGroupInfo._(super.specs, super.ids, super.nav)
    extends On<GroupInfoNav> {
  this : super._();
  OnGroupInfo call(String id) =>
      OnGroupInfo._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnWallet._(super.specs, super.ids, super.nav)
    extends On<WalletNav> {
  this : super._();
  On<BalanceNav> get balance =>
      On._([...specs, _Screens.balance], [...ids, null], const BalanceNav._());
  OnAccounts get accounts => OnAccounts._(
    [...specs, _Screens.accounts],
    [...ids, null],
    const AccountsNav._(),
  );
  On<SendMoneyNav> get sendMoney => On._(
    [...specs, _Screens.sendMoney],
    [...ids, null],
    const SendMoneyNav._(),
  );
  On<ReceiveMoneyNav> get receiveMoney => On._(
    [...specs, _Screens.receiveMoney],
    [...ids, null],
    const ReceiveMoneyNav._(),
  );
  OnPaymentMethods get paymentMethods => OnPaymentMethods._(
    [...specs, _Screens.paymentMethods],
    [...ids, null],
    const PaymentMethodsNav._(),
  );
}

final class const OnAccounts._(super.specs, super.ids, super.nav)
    extends On<AccountsNav> {
  this : super._();
  OnAccount get account => OnAccount._(
    [...specs, _Screens.account],
    [...ids, null],
    const AccountNav._(),
  );
}

final class const OnAccount._(super.specs, super.ids, super.nav)
    extends On<AccountNav> {
  this : super._();
  OnTransactions get transactions => OnTransactions._(
    [...specs, _Screens.transactions],
    [...ids, null],
    const TransactionsNav._(),
  );
  OnStatements get statements => OnStatements._(
    [...specs, _Screens.statements],
    [...ids, null],
    const StatementsNav._(),
  );
  OnAccount call(String id) =>
      OnAccount._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnTransactions._(super.specs, super.ids, super.nav)
    extends On<TransactionsNav> {
  this : super._();
  OnTransaction get transaction => OnTransaction._(
    [...specs, _Screens.transaction],
    [...ids, null],
    const TransactionNav._(),
  );
}

final class const OnTransaction._(super.specs, super.ids, super.nav)
    extends On<TransactionNav> {
  this : super._();
  OnTransactionItem get transactionItem => OnTransactionItem._(
    [...specs, _Screens.transactionItem],
    [...ids, null],
    const TransactionItemNav._(),
  );
  OnTransaction call(String id) =>
      OnTransaction._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnTransactionItem._(super.specs, super.ids, super.nav)
    extends On<TransactionItemNav> {
  this : super._();
  OnTransactionItem call(String id) =>
      OnTransactionItem._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnStatements._(super.specs, super.ids, super.nav)
    extends On<StatementsNav> {
  this : super._();
  OnStatement get statement => OnStatement._(
    [...specs, _Screens.statement],
    [...ids, null],
    const StatementNav._(),
  );
}

final class const OnStatement._(super.specs, super.ids, super.nav)
    extends On<StatementNav> {
  this : super._();
  OnStatement call(String id) =>
      OnStatement._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnPaymentMethods._(super.specs, super.ids, super.nav)
    extends On<PaymentMethodsNav> {
  this : super._();
  On<AddCardNav> get addCard =>
      On._([...specs, _Screens.addCard], [...ids, null], const AddCardNav._());
  OnCard get card =>
      OnCard._([...specs, _Screens.card], [...ids, null], const CardNav._());
}

final class const OnCard._(super.specs, super.ids, super.nav)
    extends On<CardNav> {
  this : super._();
  OnCard call(String id) =>
      OnCard._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnProfile._(super.specs, super.ids, super.nav)
    extends On<ProfileNav> {
  this : super._();
  OnUserProfile4 get userProfile => OnUserProfile4._(
    [...specs, _Screens.userProfile],
    [...ids, null],
    const UserProfileNav4._(),
  );
  OnFollowers get followers => OnFollowers._(
    [...specs, _Screens.followers],
    [...ids, null],
    const FollowersNav._(),
  );
  OnFollowing get following => OnFollowing._(
    [...specs, _Screens.following],
    [...ids, null],
    const FollowingNav._(),
  );
  On<EditProfileNav> get editProfile => On._(
    [...specs, _Screens.editProfile],
    [...ids, null],
    const EditProfileNav._(),
  );
  On<AchievementsNav> get achievements => On._(
    [...specs, _Screens.achievements],
    [...ids, null],
    const AchievementsNav._(),
  );
  OnBadges get badges => OnBadges._(
    [...specs, _Screens.badges],
    [...ids, null],
    const BadgesNav._(),
  );
  On<SavedPostsNav> get savedPosts => On._(
    [...specs, _Screens.savedPosts],
    [...ids, null],
    const SavedPostsNav._(),
  );
  On<DraftsNav> get drafts =>
      On._([...specs, _Screens.drafts], [...ids, null], const DraftsNav._());
  On<MyListingsNav> get myListings => On._(
    [...specs, _Screens.myListings],
    [...ids, null],
    const MyListingsNav._(),
  );
}

final class const OnUserProfile4._(super.specs, super.ids, super.nav)
    extends On<UserProfileNav4> {
  this : super._();
  OnUserProfile4 call(String id) =>
      OnUserProfile4._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnFollowers._(super.specs, super.ids, super.nav)
    extends On<FollowersNav> {
  this : super._();
  OnConnection get connection => OnConnection._(
    [...specs, _Screens.connection],
    [...ids, null],
    const ConnectionNav._(),
  );
  OnFollowers call(String id) =>
      OnFollowers._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnConnection._(super.specs, super.ids, super.nav)
    extends On<ConnectionNav> {
  this : super._();
  On<MutualConnectionsNav> get mutualConnections => On._(
    [...specs, _Screens.mutualConnections],
    [...ids, null],
    const MutualConnectionsNav._(),
  );
  OnConnection call(String id) =>
      OnConnection._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnFollowing._(super.specs, super.ids, super.nav)
    extends On<FollowingNav> {
  this : super._();
  OnFollowing call(String id) =>
      OnFollowing._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnBadges._(super.specs, super.ids, super.nav)
    extends On<BadgesNav> {
  this : super._();
  OnBadge get badge =>
      OnBadge._([...specs, _Screens.badge], [...ids, null], const BadgeNav._());
}

final class const OnBadge._(super.specs, super.ids, super.nav)
    extends On<BadgeNav> {
  this : super._();
  OnBadge call(String id) =>
      OnBadge._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnUserProfile._(super.specs, super.ids, super.nav)
    extends On<UserProfilePlacement> {
  this : super._();
  OnUserProfile call(String id) =>
      OnUserProfile._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnNotifications._(super.specs, super.ids, super.nav)
    extends On<NotificationsNav> {
  this : super._();
  On<NotificationSettingsNav> get notificationSettings => On._(
    [...specs, _Screens.notificationSettings],
    [...ids, null],
    const NotificationSettingsNav._(),
  );
}

final class const OnSearch._(super.specs, super.ids, super.nav)
    extends On<SearchNav> {
  this : super._();
  On<SearchResultsNav> get searchResults => On._(
    [...specs, _Screens.searchResults],
    [...ids, null],
    const SearchResultsNav._(),
  );
}

final class const OnSettings._(super.specs, super.ids, super.nav)
    extends On<SettingsNav> {
  this : super._();
  On<AccountSettingsNav> get accountSettings => On._(
    [...specs, _Screens.accountSettings],
    [...ids, null],
    const AccountSettingsNav._(),
  );
  OnSecurity get security => OnSecurity._(
    [...specs, _Screens.security],
    [...ids, null],
    const SecurityNav._(),
  );
  On<PrivacyNav> get privacy =>
      On._([...specs, _Screens.privacy], [...ids, null], const PrivacyNav._());
  On<AppearanceNav> get appearance => On._(
    [...specs, _Screens.appearance],
    [...ids, null],
    const AppearanceNav._(),
  );
  On<LanguageNav> get language => On._(
    [...specs, _Screens.language],
    [...ids, null],
    const LanguageNav._(),
  );
  On<ConnectedAppsNav> get connectedApps => On._(
    [...specs, _Screens.connectedApps],
    [...ids, null],
    const ConnectedAppsNav._(),
  );
  OnAbout get about =>
      OnAbout._([...specs, _Screens.about], [...ids, null], const AboutNav._());
  On<BlockedUsersNav> get blockedUsers => On._(
    [...specs, _Screens.blockedUsers],
    [...ids, null],
    const BlockedUsersNav._(),
  );
  OnDevices get devices => OnDevices._(
    [...specs, _Screens.devices],
    [...ids, null],
    const DevicesNav._(),
  );
  On<DataExportNav> get dataExport => On._(
    [...specs, _Screens.dataExport],
    [...ids, null],
    const DataExportNav._(),
  );
  On<DeleteAccountNav> get deleteAccount => On._(
    [...specs, _Screens.deleteAccount],
    [...ids, null],
    const DeleteAccountNav._(),
  );
  OnIntegrations get integrations => OnIntegrations._(
    [...specs, _Screens.integrations],
    [...ids, null],
    const IntegrationsNav._(),
  );
  OnSupport get support => OnSupport._(
    [...specs, Support.support],
    [...ids, null],
    const SupportNav._(),
  );
  OnAdmin get admin =>
      OnAdmin._([...specs, Admin.admin], [...ids, null], const AdminNav._());
}

final class const OnSecurity._(super.specs, super.ids, super.nav)
    extends On<SecurityNav> {
  this : super._();
  On<TwoFactorSettingsNav> get twoFactorSettings => On._(
    [...specs, _Screens.twoFactorSettings],
    [...ids, null],
    const TwoFactorSettingsNav._(),
  );
}

final class const OnAbout._(super.specs, super.ids, super.nav)
    extends On<AboutNav> {
  this : super._();
  OnHelp get help =>
      OnHelp._([...specs, _Screens.help], [...ids, null], const HelpNav._());
  On<FeedbackNav> get feedback => On._(
    [...specs, _Screens.feedback],
    [...ids, null],
    const FeedbackNav._(),
  );
}

final class const OnHelp._(super.specs, super.ids, super.nav)
    extends On<HelpNav> {
  this : super._();
  OnHelpCategory get helpCategory => OnHelpCategory._(
    [...specs, _Screens.helpCategory],
    [...ids, null],
    const HelpCategoryNav._(),
  );
}

final class const OnHelpCategory._(super.specs, super.ids, super.nav)
    extends On<HelpCategoryNav> {
  this : super._();
  OnFaq get faq =>
      OnFaq._([...specs, _Screens.faq], [...ids, null], const FaqNav._());
  OnHelpCategory call(String id) =>
      OnHelpCategory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnFaq._(super.specs, super.ids, super.nav)
    extends On<FaqNav> {
  this : super._();
  OnFaqArticle get faqArticle => OnFaqArticle._(
    [...specs, _Screens.faqArticle],
    [...ids, null],
    const FaqArticleNav._(),
  );
}

final class const OnFaqArticle._(super.specs, super.ids, super.nav)
    extends On<FaqArticleNav> {
  this : super._();
  OnFaqArticle call(String id) =>
      OnFaqArticle._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnDevices._(super.specs, super.ids, super.nav)
    extends On<DevicesNav> {
  this : super._();
  OnDevice get device => OnDevice._(
    [...specs, _Screens.device],
    [...ids, null],
    const DeviceNav._(),
  );
}

final class const OnDevice._(super.specs, super.ids, super.nav)
    extends On<DeviceNav> {
  this : super._();
  On<SessionsNav> get sessions => On._(
    [...specs, _Screens.sessions],
    [...ids, null],
    const SessionsNav._(),
  );
  OnSession get session => OnSession._(
    [...specs, _Screens.session],
    [...ids, null],
    const SessionNav._(),
  );
  OnDevice call(String id) =>
      OnDevice._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSession._(super.specs, super.ids, super.nav)
    extends On<SessionNav> {
  this : super._();
  OnSession call(String id) =>
      OnSession._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnIntegrations._(super.specs, super.ids, super.nav)
    extends On<IntegrationsNav> {
  this : super._();
  On<ApiKeysNav> get apiKeys =>
      On._([...specs, _Screens.apiKeys], [...ids, null], const ApiKeysNav._());
}

final class const OnSupport._(super.specs, super.ids, super.nav)
    extends On<SupportNav> {
  this : super._();
  OnSupportTickets get supportTickets => OnSupportTickets._(
    [...specs, Support.supportTickets],
    [...ids, null],
    const SupportTicketsNav._(),
  );
  On<NewTicketNav> get newTicket => On._(
    [...specs, Support.newTicket],
    [...ids, null],
    const NewTicketNav._(),
  );
  OnKnowledgeBase get knowledgeBase => OnKnowledgeBase._(
    [...specs, Support.knowledgeBase],
    [...ids, null],
    const KnowledgeBaseNav._(),
  );
}

final class const OnSupportTickets._(super.specs, super.ids, super.nav)
    extends On<SupportTicketsNav> {
  this : super._();
  OnSupportTicket get supportTicket => OnSupportTicket._(
    [...specs, Support.supportTicket],
    [...ids, null],
    const SupportTicketNav._(),
  );
}

final class const OnSupportTicket._(super.specs, super.ids, super.nav)
    extends On<SupportTicketNav> {
  this : super._();
  OnSupportTicket call(String id) =>
      OnSupportTicket._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnKnowledgeBase._(super.specs, super.ids, super.nav)
    extends On<KnowledgeBaseNav> {
  this : super._();
  OnArticle get article => OnArticle._(
    [...specs, Support.article],
    [...ids, null],
    const ArticleNav._(),
  );
}

final class const OnArticle._(super.specs, super.ids, super.nav)
    extends On<ArticleNav> {
  this : super._();
  OnArticle call(String id) =>
      OnArticle._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnAdmin._(super.specs, super.ids, super.nav)
    extends On<AdminNav> {
  this : super._();
  OnAdminUsers get adminUsers => OnAdminUsers._(
    [...specs, Admin.adminUsers],
    [...ids, null],
    const AdminUsersNav._(),
  );
  On<AdminAuditLogNav> get adminAuditLog => On._(
    [...specs, Admin.adminAuditLog],
    [...ids, null],
    const AdminAuditLogNav._(),
  );
  On<AdminFeatureFlagsNav> get adminFeatureFlags => On._(
    [...specs, Admin.adminFeatureFlags],
    [...ids, null],
    const AdminFeatureFlagsNav._(),
  );
  OnWebhooks get webhooks => OnWebhooks._(
    [...specs, Admin.webhooks],
    [...ids, null],
    const WebhooksNav._(),
  );
}

final class const OnAdminUsers._(super.specs, super.ids, super.nav)
    extends On<AdminUsersNav> {
  this : super._();
  OnAdminUser get adminUser => OnAdminUser._(
    [...specs, Admin.adminUser],
    [...ids, null],
    const AdminUserNav._(),
  );
}

final class const OnAdminUser._(super.specs, super.ids, super.nav)
    extends On<AdminUserNav> {
  this : super._();
  OnAdminRole get adminRole => OnAdminRole._(
    [...specs, Admin.adminRole],
    [...ids, null],
    const AdminRoleNav._(),
  );
  OnAdminUser call(String id) =>
      OnAdminUser._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnAdminRole._(super.specs, super.ids, super.nav)
    extends On<AdminRoleNav> {
  this : super._();
  OnAdminRole call(String id) =>
      OnAdminRole._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnWebhooks._(super.specs, super.ids, super.nav)
    extends On<WebhooksNav> {
  this : super._();
  OnWebhook get webhook => OnWebhook._(
    [...specs, Admin.webhook],
    [...ids, null],
    const WebhookNav._(),
  );
}

final class const OnWebhook._(super.specs, super.ids, super.nav)
    extends On<WebhookNav> {
  this : super._();
  OnWebhook call(String id) =>
      OnWebhook._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnWorkspace._(super.specs, super.ids, super.nav)
    extends On<WorkspaceNav> {
  this : super._();
  OnProject get project => OnProject._(
    [...specs, _Screens.project],
    [...ids, null],
    const ProjectNav._(),
  );
}

final class const OnProject._(super.specs, super.ids, super.nav)
    extends On<ProjectNav> {
  this : super._();
  OnBoard get board =>
      OnBoard._([...specs, _Screens.board], [...ids, null], const BoardNav._());
  OnUserProfile5 get userProfile => OnUserProfile5._(
    [...specs, _Screens.userProfile],
    [...ids, null],
    const UserProfileNav5._(),
  );
  OnProject call(String id) =>
      OnProject._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnBoard._(super.specs, super.ids, super.nav)
    extends On<BoardNav> {
  this : super._();
  OnTaskList get taskList => OnTaskList._(
    [...specs, _Screens.taskList],
    [...ids, null],
    const TaskListNav._(),
  );
  OnBoard call(String id) =>
      OnBoard._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnTaskList._(super.specs, super.ids, super.nav)
    extends On<TaskListNav> {
  this : super._();
  OnTask get task =>
      OnTask._([...specs, _Screens.task], [...ids, null], const TaskNav._());
  OnMilestone get milestone => OnMilestone._(
    [...specs, _Screens.milestone],
    [...ids, null],
    const MilestoneNav._(),
  );
  OnSprint get sprint => OnSprint._(
    [...specs, _Screens.sprint],
    [...ids, null],
    const SprintNav._(),
  );
  OnTaskList call(String id) =>
      OnTaskList._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnTask._(super.specs, super.ids, super.nav)
    extends On<TaskNav> {
  this : super._();
  OnSubtask get subtask => OnSubtask._(
    [...specs, _Screens.subtask],
    [...ids, null],
    const SubtaskNav._(),
  );
  OnAssignee get assignee => OnAssignee._(
    [...specs, _Screens.assignee],
    [...ids, null],
    const AssigneeNav._(),
  );
  OnLabel get label =>
      OnLabel._([...specs, _Screens.label], [...ids, null], const LabelNav._());
  OnTask call(String id) =>
      OnTask._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSubtask._(super.specs, super.ids, super.nav)
    extends On<SubtaskNav> {
  this : super._();
  OnChecklistItem get checklistItem => OnChecklistItem._(
    [...specs, _Screens.checklistItem],
    [...ids, null],
    const ChecklistItemNav._(),
  );
  OnSubtask call(String id) =>
      OnSubtask._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnChecklistItem._(super.specs, super.ids, super.nav)
    extends On<ChecklistItemNav> {
  this : super._();
  OnChecklistItem call(String id) =>
      OnChecklistItem._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnAssignee._(super.specs, super.ids, super.nav)
    extends On<AssigneeNav> {
  this : super._();
  OnAssignee call(String id) =>
      OnAssignee._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnLabel._(super.specs, super.ids, super.nav)
    extends On<LabelNav> {
  this : super._();
  OnLabel call(String id) =>
      OnLabel._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnMilestone._(super.specs, super.ids, super.nav)
    extends On<MilestoneNav> {
  this : super._();
  OnMilestone call(String id) =>
      OnMilestone._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnSprint._(super.specs, super.ids, super.nav)
    extends On<SprintNav> {
  this : super._();
  OnSprint call(String id) =>
      OnSprint._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnUserProfile5._(super.specs, super.ids, super.nav)
    extends On<UserProfileNav5> {
  this : super._();
  OnUserProfile5 call(String id) =>
      OnUserProfile5._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnEditTask._(super.specs, super.ids, super.nav)
    extends On<EditTaskNav> {
  this : super._();
  OnEditTask call(String id) =>
      OnEditTask._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnTaskComment._(super.specs, super.ids, super.nav)
    extends On<TaskCommentNav> {
  this : super._();
  OnTaskComment call(String id) =>
      OnTaskComment._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnForum._(super.specs, super.ids, super.nav)
    extends On<ForumNav> {
  this : super._();
  OnForumCategory get forumCategory => OnForumCategory._(
    [...specs, _Screens.forumCategory],
    [...ids, null],
    const ForumCategoryNav._(),
  );
}

final class const OnForumCategory._(super.specs, super.ids, super.nav)
    extends On<ForumCategoryNav> {
  this : super._();
  OnForumThread get forumThread => OnForumThread._(
    [...specs, _Screens.forumThread],
    [...ids, null],
    const ForumThreadNav._(),
  );
  OnForumCategory call(String id) =>
      OnForumCategory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnForumThread._(super.specs, super.ids, super.nav)
    extends On<ForumThreadNav> {
  this : super._();
  OnForumReply get forumReply => OnForumReply._(
    [...specs, _Screens.forumReply],
    [...ids, null],
    const ForumReplyNav._(),
  );
  OnForumThread call(String id) =>
      OnForumThread._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnForumReply._(super.specs, super.ids, super.nav)
    extends On<ForumReplyNav> {
  this : super._();
  OnUserProfile6 get userProfile => OnUserProfile6._(
    [...specs, _Screens.userProfile],
    [...ids, null],
    const UserProfileNav6._(),
  );
  OnForumReply call(String id) =>
      OnForumReply._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnUserProfile6._(super.specs, super.ids, super.nav)
    extends On<UserProfileNav6> {
  this : super._();
  OnUserProfile6 call(String id) =>
      OnUserProfile6._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnReportThread._(super.specs, super.ids, super.nav)
    extends On<ReportThreadNav> {
  this : super._();
  OnReportThread call(String id) =>
      OnReportThread._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnLearn._(super.specs, super.ids, super.nav)
    extends On<LearnNav> {
  this : super._();
  OnCourse get course => OnCourse._(
    [...specs, _Screens.course],
    [...ids, null],
    const CourseNav._(),
  );
}

final class const OnCourse._(super.specs, super.ids, super.nav)
    extends On<CourseNav> {
  this : super._();
  OnCourseModule get courseModule => OnCourseModule._(
    [...specs, _Screens.courseModule],
    [...ids, null],
    const CourseModuleNav._(),
  );
  OnCourse call(String id) =>
      OnCourse._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnCourseModule._(super.specs, super.ids, super.nav)
    extends On<CourseModuleNav> {
  this : super._();
  OnLesson get lesson => OnLesson._(
    [...specs, _Screens.lesson],
    [...ids, null],
    const LessonNav._(),
  );
  OnInstructor get instructor => OnInstructor._(
    [...specs, _Screens.instructor],
    [...ids, null],
    const InstructorNav._(),
  );
  OnCourseModule call(String id) =>
      OnCourseModule._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnLesson._(super.specs, super.ids, super.nav)
    extends On<LessonNav> {
  this : super._();
  OnQuiz get quiz =>
      OnQuiz._([...specs, _Screens.quiz], [...ids, null], const QuizNav._());
  OnCourseReview get courseReview => OnCourseReview._(
    [...specs, _Screens.courseReview],
    [...ids, null],
    const CourseReviewNav._(),
  );
  OnLesson call(String id) =>
      OnLesson._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnQuiz._(super.specs, super.ids, super.nav)
    extends On<QuizNav> {
  this : super._();
  OnQuestion get question => OnQuestion._(
    [...specs, _Screens.question],
    [...ids, null],
    const QuestionNav._(),
  );
  OnQuiz call(String id) =>
      OnQuiz._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnQuestion._(super.specs, super.ids, super.nav)
    extends On<QuestionNav> {
  this : super._();
  OnQuestion call(String id) =>
      OnQuestion._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnCourseReview._(super.specs, super.ids, super.nav)
    extends On<CourseReviewNav> {
  this : super._();
  OnCourseReview call(String id) =>
      OnCourseReview._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnInstructor._(super.specs, super.ids, super.nav)
    extends On<InstructorNav> {
  this : super._();
  OnInstructor call(String id) =>
      OnInstructor._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnAnswer._(super.specs, super.ids, super.nav)
    extends On<AnswerNav> {
  this : super._();
  OnAnswer call(String id) =>
      OnAnswer._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnCertificate._(super.specs, super.ids, super.nav)
    extends On<CertificateNav> {
  this : super._();
  OnCertificate call(String id) =>
      OnCertificate._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnShop._(super.specs, super.ids, super.nav)
    extends On<ShopNav> {
  this : super._();
  OnShopDept get shopDept => OnShopDept._(
    [...specs, _Screens.shopDept],
    [...ids, null],
    const ShopDeptNav._(),
  );
  On<CompareProductsNav> get compareProducts => On._(
    [...specs, _Screens.compareProducts],
    [...ids, null],
    const CompareProductsNav._(),
  );
}

final class const OnShopDept._(super.specs, super.ids, super.nav)
    extends On<ShopDeptNav> {
  this : super._();
  OnShopCategory get shopCategory => OnShopCategory._(
    [...specs, _Screens.shopCategory],
    [...ids, null],
    const ShopCategoryNav._(),
  );
  OnShopDept call(String id) =>
      OnShopDept._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnShopCategory._(super.specs, super.ids, super.nav)
    extends On<ShopCategoryNav> {
  this : super._();
  OnShopSubcategory get shopSubcategory => OnShopSubcategory._(
    [...specs, _Screens.shopSubcategory],
    [...ids, null],
    const ShopSubcategoryNav._(),
  );
  OnShopCategory call(String id) =>
      OnShopCategory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnShopSubcategory._(super.specs, super.ids, super.nav)
    extends On<ShopSubcategoryNav> {
  this : super._();
  OnProduct get product => OnProduct._(
    [...specs, _Screens.product],
    [...ids, null],
    const ProductNav._(),
  );
  OnShopSubcategory call(String id) =>
      OnShopSubcategory._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnProduct._(super.specs, super.ids, super.nav)
    extends On<ProductNav> {
  this : super._();
  OnProductVariant get productVariant => OnProductVariant._(
    [...specs, _Screens.productVariant],
    [...ids, null],
    const ProductVariantNav._(),
  );
  OnProductReview get productReview => OnProductReview._(
    [...specs, _Screens.productReview],
    [...ids, null],
    const ProductReviewNav._(),
  );
  OnBrand get brand =>
      OnBrand._([...specs, _Screens.brand], [...ids, null], const BrandNav._());
  OnProduct call(String id) =>
      OnProduct._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnProductVariant._(super.specs, super.ids, super.nav)
    extends On<ProductVariantNav> {
  this : super._();
  OnProductVariant call(String id) =>
      OnProductVariant._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnProductReview._(super.specs, super.ids, super.nav)
    extends On<ProductReviewNav> {
  this : super._();
  OnProductReview call(String id) =>
      OnProductReview._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnBrand._(super.specs, super.ids, super.nav)
    extends On<BrandNav> {
  this : super._();
  OnBrand call(String id) =>
      OnBrand._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnActivity._(super.specs, super.ids, super.nav)
    extends On<ActivityNav> {
  this : super._();
  OnWorkout get workout => OnWorkout._(
    [...specs, _Screens.workout],
    [...ids, null],
    const WorkoutNav._(),
  );
}

final class const OnWorkout._(super.specs, super.ids, super.nav)
    extends On<WorkoutNav> {
  this : super._();
  OnExercise get exercise => OnExercise._(
    [...specs, _Screens.exercise],
    [...ids, null],
    const ExerciseNav._(),
  );
  OnWorkout call(String id) =>
      OnWorkout._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnExercise._(super.specs, super.ids, super.nav)
    extends On<ExerciseNav> {
  this : super._();
  OnExerciseSet get exerciseSet => OnExerciseSet._(
    [...specs, _Screens.exerciseSet],
    [...ids, null],
    const ExerciseSetNav._(),
  );
  OnExercise call(String id) =>
      OnExercise._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnExerciseSet._(super.specs, super.ids, super.nav)
    extends On<ExerciseSetNav> {
  this : super._();
  OnExerciseSet call(String id) =>
      OnExerciseSet._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnDeepDemo._(super.specs, super.ids, super.nav)
    extends On<DeepDemoNav> {
  this : super._();
  OnLevelA get levelA => OnLevelA._(
    [...specs, _Screens.levelA],
    [...ids, null],
    const LevelANav._(),
  );
}

final class const OnLevelA._(super.specs, super.ids, super.nav)
    extends On<LevelANav> {
  this : super._();
  OnLevelB get levelB => OnLevelB._(
    [...specs, _Screens.levelB],
    [...ids, null],
    const LevelBNav._(),
  );
  OnLevelA call(String id) =>
      OnLevelA._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnLevelB._(super.specs, super.ids, super.nav)
    extends On<LevelBNav> {
  this : super._();
  OnLevelC get levelC => OnLevelC._(
    [...specs, _Screens.levelC],
    [...ids, null],
    const LevelCNav._(),
  );
  OnLevelB call(String id) =>
      OnLevelB._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnLevelC._(super.specs, super.ids, super.nav)
    extends On<LevelCNav> {
  this : super._();
  OnLevelD get levelD => OnLevelD._(
    [...specs, _Screens.levelD],
    [...ids, null],
    const LevelDNav._(),
  );
  OnLevelC call(String id) =>
      OnLevelC._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnLevelD._(super.specs, super.ids, super.nav)
    extends On<LevelDNav> {
  this : super._();
  OnLevelE get levelE => OnLevelE._(
    [...specs, _Screens.levelE],
    [...ids, null],
    const LevelENav._(),
  );
  OnLevelD call(String id) =>
      OnLevelD._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnLevelE._(super.specs, super.ids, super.nav)
    extends On<LevelENav> {
  this : super._();
  OnLevelF get levelF => OnLevelF._(
    [...specs, _Screens.levelF],
    [...ids, null],
    const LevelFNav._(),
  );
  OnLevelE call(String id) =>
      OnLevelE._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnLevelF._(super.specs, super.ids, super.nav)
    extends On<LevelFNav> {
  this : super._();
  OnLevelF call(String id) =>
      OnLevelF._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnEditScheduled._(super.specs, super.ids, super.nav)
    extends On<EditScheduledNav> {
  this : super._();
  OnEditScheduled call(String id) =>
      OnEditScheduled._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnAttendees._(super.specs, super.ids, super.nav)
    extends On<AttendeesNav> {
  this : super._();
  OnAttendees call(String id) =>
      OnAttendees._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnEditEvent._(super.specs, super.ids, super.nav)
    extends On<EditEventNav> {
  this : super._();
  OnEditEvent call(String id) =>
      OnEditEvent._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

final class const OnTickets._(super.specs, super.ids, super.nav)
    extends On<TicketsNav> {
  this : super._();
  OnTickets call(String id) =>
      OnTickets._(specs, [...ids.sublist(0, ids.length - 1), id], nav);
}

sealed class const AnyPlacement._() extends AnyNav {
  this : super._();
}

AnyPlacement _atOf(Enum s) {
  final c = _Screens.graph.currentChain;
  return _placementOf(s, c.sublist(0, c.lastIndexOf(s) + 1));
}

AnyPlacement _placementOf(Enum s, List<Enum> p) => switch (s) {
  _Screens.splash => const SplashNav._(),
  _Screens.signIn => const SignInNav._(),
  _Screens.signUp => const SignUpNav._(),
  _Screens.onboarding => const OnboardingNav._(),
  _Screens.forgotPassword => const ForgotPasswordNav._(),
  _Screens.resetPassword => const ResetPasswordNav._(),
  _Screens.verifyEmail => const VerifyEmailNav._(),
  _Screens.twoFactor => const TwoFactorNav._(),
  _Screens.home => const HomeNav._(),
  _Screens.feed => const FeedNav._(),
  _Screens.composePost => const ComposePostNav._(),
  _Screens.story => const StoryNav._(),
  _Screens.post => const PostNav._(),
  _Screens.comment => const CommentNav._(),
  _Screens.postAuthor => const PostAuthorNav._(),
  _Screens.postComments => const PostCommentsNav._(),
  _Screens.postLikes => const PostLikesNav._(),
  _Screens.editPost => const EditPostNav._(),
  _Screens.repost => const RepostNav._(),
  _Screens.discover => const DiscoverNav._(),
  _Screens.trending => const TrendingNav._(),
  _Screens.topics => const TopicsNav._(),
  _Screens.topic => const TopicNav._(),
  _Screens.subtopic => const SubtopicNav._(),
  _Screens.hashtag => const HashtagNav._(),
  _Screens.liveNow => const LiveNowNav._(),
  _Screens.liveRoom => const LiveRoomNav._(),
  _Screens.nearby => const NearbyNav._(),
  _Screens.marketplace => const MarketplaceNav._(),
  _Screens.categories => const CategoriesNav._(),
  _Screens.category => const CategoryNav._(),
  _Screens.listing => const ListingNav._(),
  _Screens.listingVariant => const ListingVariantNav._(),
  _Screens.editListing => const EditListingNav._(),
  _Screens.sellerProfile => const SellerProfileNav._(),
  _Screens.cart => const CartNav._(),
  _Screens.checkout => const CheckoutNav._(),
  _Screens.orderConfirmation => const OrderConfirmationNav._(),
  _Screens.myOrders => const MyOrdersNav._(),
  _Screens.order => const OrderNav._(),
  _Screens.wishlist => const WishlistNav._(),
  _Screens.messages => const MessagesNav._(),
  _Screens.chats => const ChatsNav._(),
  _Screens.chat => const ChatNav._(),
  _Screens.thread => const ThreadNav._(),
  _Screens.message => const MessageNav._(),
  _Screens.messageReply => const MessageReplyNav._(),
  _Screens.voiceCall => const VoiceCallNav._(),
  _Screens.newChat => const NewChatNav._(),
  _Screens.groupChat => const GroupChatNav._(),
  _Screens.groupInfo => const GroupInfoNav._(),
  _Screens.wallet => const WalletNav._(),
  _Screens.balance => const BalanceNav._(),
  _Screens.accounts => const AccountsNav._(),
  _Screens.account => const AccountNav._(),
  _Screens.transactions => const TransactionsNav._(),
  _Screens.transaction => const TransactionNav._(),
  _Screens.transactionItem => const TransactionItemNav._(),
  _Screens.sendMoney => const SendMoneyNav._(),
  _Screens.receiveMoney => const ReceiveMoneyNav._(),
  _Screens.paymentMethods => const PaymentMethodsNav._(),
  _Screens.addCard => const AddCardNav._(),
  _Screens.card => const CardNav._(),
  _Screens.statements => const StatementsNav._(),
  _Screens.statement => const StatementNav._(),
  _Screens.profile => const ProfileNav._(),
  _Screens.userProfile => _resolveUserProfilePlacement(p),
  _Screens.followers => const FollowersNav._(),
  _Screens.following => const FollowingNav._(),
  _Screens.connection => const ConnectionNav._(),
  _Screens.mutualConnections => const MutualConnectionsNav._(),
  _Screens.editProfile => const EditProfileNav._(),
  _Screens.achievements => const AchievementsNav._(),
  _Screens.badges => const BadgesNav._(),
  _Screens.badge => const BadgeNav._(),
  _Screens.savedPosts => const SavedPostsNav._(),
  _Screens.drafts => const DraftsNav._(),
  _Screens.myListings => const MyListingsNav._(),
  _Screens.notifications => const NotificationsNav._(),
  _Screens.notificationSettings => const NotificationSettingsNav._(),
  _Screens.search => const SearchNav._(),
  _Screens.searchResults => const SearchResultsNav._(),
  _Screens.settings => const SettingsNav._(),
  _Screens.accountSettings => const AccountSettingsNav._(),
  _Screens.security => const SecurityNav._(),
  _Screens.twoFactorSettings => const TwoFactorSettingsNav._(),
  _Screens.privacy => const PrivacyNav._(),
  _Screens.appearance => const AppearanceNav._(),
  _Screens.language => const LanguageNav._(),
  _Screens.connectedApps => const ConnectedAppsNav._(),
  _Screens.about => const AboutNav._(),
  _Screens.help => const HelpNav._(),
  _Screens.helpCategory => const HelpCategoryNav._(),
  _Screens.faq => const FaqNav._(),
  _Screens.faqArticle => const FaqArticleNav._(),
  _Screens.feedback => const FeedbackNav._(),
  _Screens.blockedUsers => const BlockedUsersNav._(),
  _Screens.devices => const DevicesNav._(),
  _Screens.device => const DeviceNav._(),
  _Screens.sessions => const SessionsNav._(),
  _Screens.session => const SessionNav._(),
  _Screens.dataExport => const DataExportNav._(),
  _Screens.deleteAccount => const DeleteAccountNav._(),
  _Screens.workspace => const WorkspaceNav._(),
  _Screens.project => const ProjectNav._(),
  _Screens.board => const BoardNav._(),
  _Screens.taskList => const TaskListNav._(),
  _Screens.task => const TaskNav._(),
  _Screens.subtask => const SubtaskNav._(),
  _Screens.checklistItem => const ChecklistItemNav._(),
  _Screens.editTask => const EditTaskNav._(),
  _Screens.taskComment => const TaskCommentNav._(),
  _Screens.assignee => const AssigneeNav._(),
  _Screens.label => const LabelNav._(),
  _Screens.milestone => const MilestoneNav._(),
  _Screens.sprint => const SprintNav._(),
  _Screens.forum => const ForumNav._(),
  _Screens.forumCategory => const ForumCategoryNav._(),
  _Screens.forumThread => const ForumThreadNav._(),
  _Screens.forumReply => const ForumReplyNav._(),
  _Screens.reportThread => const ReportThreadNav._(),
  _Screens.learn => const LearnNav._(),
  _Screens.course => const CourseNav._(),
  _Screens.courseModule => const CourseModuleNav._(),
  _Screens.lesson => const LessonNav._(),
  _Screens.quiz => const QuizNav._(),
  _Screens.question => const QuestionNav._(),
  _Screens.answer => const AnswerNav._(),
  _Screens.courseReview => const CourseReviewNav._(),
  _Screens.instructor => const InstructorNav._(),
  _Screens.certificate => const CertificateNav._(),
  _Screens.shop => const ShopNav._(),
  _Screens.shopDept => const ShopDeptNav._(),
  _Screens.shopCategory => const ShopCategoryNav._(),
  _Screens.shopSubcategory => const ShopSubcategoryNav._(),
  _Screens.product => const ProductNav._(),
  _Screens.productVariant => const ProductVariantNav._(),
  _Screens.productReview => const ProductReviewNav._(),
  _Screens.brand => const BrandNav._(),
  _Screens.compareProducts => const CompareProductsNav._(),
  _Screens.activity => const ActivityNav._(),
  _Screens.workout => const WorkoutNav._(),
  _Screens.exercise => const ExerciseNav._(),
  _Screens.exerciseSet => const ExerciseSetNav._(),
  _Screens.deepDemo => const DeepDemoNav._(),
  _Screens.levelA => const LevelANav._(),
  _Screens.levelB => const LevelBNav._(),
  _Screens.levelC => const LevelCNav._(),
  _Screens.levelD => const LevelDNav._(),
  _Screens.levelE => const LevelENav._(),
  _Screens.levelF => const LevelFNav._(),
  _Screens.integrations => const IntegrationsNav._(),
  _Screens.apiKeys => const ApiKeysNav._(),
  CreatorStudio.studio => const StudioNav._(),
  CreatorStudio.analytics => const AnalyticsNav._(),
  CreatorStudio.audience => const AudienceNav._(),
  CreatorStudio.scheduled => const ScheduledNav._(),
  CreatorStudio.scheduledPost => const ScheduledPostNav._(),
  CreatorStudio.editScheduled => const EditScheduledNav._(),
  CreatorStudio.monetization => const MonetizationNav._(),
  CreatorStudio.payouts => const PayoutsNav._(),
  Events.events => const EventsNav._(),
  Events.event => const EventNav._(),
  Events.attendees => const AttendeesNav._(),
  Events.editEvent => const EditEventNav._(),
  Events.createEvent => const CreateEventNav._(),
  Events.tickets => const TicketsNav._(),
  Support.support => const SupportNav._(),
  Support.supportTickets => const SupportTicketsNav._(),
  Support.supportTicket => const SupportTicketNav._(),
  Support.newTicket => const NewTicketNav._(),
  Support.knowledgeBase => const KnowledgeBaseNav._(),
  Support.article => const ArticleNav._(),
  Admin.admin => const AdminNav._(),
  Admin.adminUsers => const AdminUsersNav._(),
  Admin.adminUser => const AdminUserNav._(),
  Admin.adminAuditLog => const AdminAuditLogNav._(),
  Admin.adminRole => const AdminRoleNav._(),
  Admin.adminFeatureFlags => const AdminFeatureFlagsNav._(),
  Admin.webhooks => const WebhooksNav._(),
  Admin.webhook => const WebhookNav._(),
  BootScreen.root => const Root._(),
  _ => throw StateError('not a _Screens screen'),
};

abstract base class const AnyNav._();

final class const SplashNav._() extends AnyPlacement {
  this : super._();
  SplashNav surface() {
    _Screens.graph.popTo(_Screens.splash);
    return const SplashNav._();
  }
}

final class const SignInNav._() extends AnyPlacement {
  this : super._();
  SignInNav surface() {
    _Screens.graph.popTo(_Screens.signIn);
    return const SignInNav._();
  }
}

final class const SignUpNav._() extends AnyPlacement {
  this : super._();
  SignUpNav surface() {
    _Screens.graph.popTo(_Screens.signUp);
    return const SignUpNav._();
  }
}

final class const OnboardingNav._() extends AnyPlacement {
  this : super._();
  OnboardingNav surface() {
    _Screens.graph.popTo(_Screens.onboarding);
    return const OnboardingNav._();
  }
}

final class const ForgotPasswordNav._() extends AnyPlacement {
  this : super._();
  ForgotPasswordNav surface() {
    _Screens.graph.popTo(_Screens.forgotPassword);
    return const ForgotPasswordNav._();
  }

  ResetPasswordNav goResetPassword(String id) {
    _Screens.graph.goFrom(_Screens.forgotPassword, _Screens.resetPassword, id);
    return const ResetPasswordNav._();
  }
}

final class const ResetPasswordNav._() extends AnyPlacement {
  this : super._();
  ResetPasswordNav surface() {
    _Screens.graph.popTo(_Screens.resetPassword);
    return const ResetPasswordNav._();
  }
}

final class const VerifyEmailNav._() extends AnyPlacement {
  this : super._();
  VerifyEmailNav surface() {
    _Screens.graph.popTo(_Screens.verifyEmail);
    return const VerifyEmailNav._();
  }
}

final class const TwoFactorNav._() extends AnyPlacement {
  this : super._();
  TwoFactorNav surface() {
    _Screens.graph.popTo(_Screens.twoFactor);
    return const TwoFactorNav._();
  }
}

final class const HomeNav._() extends AnyPlacement {
  this : super._();
  HomeNav surface() {
    _Screens.graph.popTo(_Screens.home);
    return const HomeNav._();
  }

  FeedNav goFeed() {
    _Screens.graph.goFrom(_Screens.home, _Screens.feed, null);
    return const FeedNav._();
  }

  StudioNav goStudio() {
    _Screens.graph.goFrom(_Screens.home, CreatorStudio.studio, null);
    return const StudioNav._();
  }
}

final class const FeedNav._() extends AnyPlacement {
  this : super._();
  FeedNav surface() {
    _Screens.graph.popTo(_Screens.feed);
    return const FeedNav._();
  }

  FeedQueryMut get query => const FeedQueryMut._();
  FeedFragmentMut get fragment => const FeedFragmentMut._();
  PostNav goPost(String id) {
    _Screens.graph.goFrom(_Screens.feed, _Screens.post, id);
    return const PostNav._();
  }

  StoryNav goStory(String id) {
    _Screens.graph.goFrom(_Screens.feed, _Screens.story, id);
    return const StoryNav._();
  }

  ComposePostNav goComposePost() {
    _Screens.graph.goFrom(_Screens.feed, _Screens.composePost, null);
    return const ComposePostNav._();
  }

  UserProfileNav1 goUserProfile(String id) {
    _Screens.graph.goFrom(_Screens.feed, _Screens.userProfile, id);
    return const UserProfileNav1._();
  }
}

final class const ComposePostNav._() extends AnyPlacement {
  this : super._();
  ComposePostNav surface() {
    _Screens.graph.popTo(_Screens.composePost);
    return const ComposePostNav._();
  }
}

final class const StoryNav._() extends AnyPlacement {
  this : super._();
  StoryNav surface() {
    _Screens.graph.popTo(_Screens.story);
    return const StoryNav._();
  }

  StoryNav goStory(String id) {
    _Screens.graph.goFrom(_Screens.story, _Screens.story, id);
    return const StoryNav._();
  }
}

final class const PostNav._() extends AnyPlacement {
  this : super._();
  PostNav surface() {
    _Screens.graph.popTo(_Screens.post);
    return const PostNav._();
  }

  PostQueryMut get query => const PostQueryMut._();
  CommentNav goComment(String id) {
    _Screens.graph.goFrom(_Screens.post, _Screens.comment, id);
    return const CommentNav._();
  }

  PostAuthorNav goPostAuthor(String id) {
    _Screens.graph.goFrom(_Screens.post, _Screens.postAuthor, id);
    return const PostAuthorNav._();
  }

  PostCommentsNav goPostComments() {
    _Screens.graph.goFrom(
      _Screens.post,
      _Screens.postComments,
      _idOf(_Screens.post),
    );
    return const PostCommentsNav._();
  }

  PostLikesNav goPostLikes() {
    _Screens.graph.goFrom(
      _Screens.post,
      _Screens.postLikes,
      _idOf(_Screens.post),
    );
    return const PostLikesNav._();
  }

  EditPostNav goEditPost() {
    _Screens.graph.goFrom(
      _Screens.post,
      _Screens.editPost,
      _idOf(_Screens.post),
    );
    return const EditPostNav._();
  }

  RepostNav goRepost() {
    _Screens.graph.goFrom(_Screens.post, _Screens.repost, _idOf(_Screens.post));
    return const RepostNav._();
  }

  PostNav goPost(String id) {
    _Screens.graph.goFrom(_Screens.post, _Screens.post, id);
    return const PostNav._();
  }
}

final class const CommentNav._() extends AnyPlacement {
  this : super._();
  CommentNav surface() {
    _Screens.graph.popTo(_Screens.comment);
    return const CommentNav._();
  }

  CommentNav goComment(String id) {
    _Screens.graph.goFrom(_Screens.comment, _Screens.comment, id);
    return const CommentNav._();
  }

  PostNav goPost(String id) {
    _Screens.graph.goFrom(_Screens.comment, _Screens.post, id);
    return const PostNav._();
  }
}

final class const PostAuthorNav._() extends AnyPlacement {
  this : super._();
  PostAuthorNav surface() {
    _Screens.graph.popTo(_Screens.postAuthor);
    return const PostAuthorNav._();
  }

  PostAuthorNav goPostAuthor(String id) {
    _Screens.graph.goFrom(_Screens.postAuthor, _Screens.postAuthor, id);
    return const PostAuthorNav._();
  }

  PostNav goPost(String id) {
    _Screens.graph.goFrom(_Screens.postAuthor, _Screens.post, id);
    return const PostNav._();
  }
}

final class const PostCommentsNav._() extends AnyPlacement {
  this : super._();
  PostCommentsNav surface() {
    _Screens.graph.popTo(_Screens.postComments);
    return const PostCommentsNav._();
  }
}

final class const PostLikesNav._() extends AnyPlacement {
  this : super._();
  PostLikesNav surface() {
    _Screens.graph.popTo(_Screens.postLikes);
    return const PostLikesNav._();
  }
}

final class const EditPostNav._() extends AnyPlacement {
  this : super._();
  EditPostNav surface() {
    _Screens.graph.popTo(_Screens.editPost);
    return const EditPostNav._();
  }
}

final class const RepostNav._() extends AnyPlacement {
  this : super._();
  RepostNav surface() {
    _Screens.graph.popTo(_Screens.repost);
    return const RepostNav._();
  }
}

final class const DiscoverNav._() extends AnyPlacement {
  this : super._();
  DiscoverNav surface() {
    _Screens.graph.popTo(_Screens.discover);
    return const DiscoverNav._();
  }

  DiscoverQueryMut get query => const DiscoverQueryMut._();
  TrendingNav goTrending() {
    _Screens.graph.goFrom(_Screens.discover, _Screens.trending, null);
    return const TrendingNav._();
  }

  TopicsNav goTopics() {
    _Screens.graph.goFrom(_Screens.discover, _Screens.topics, null);
    return const TopicsNav._();
  }

  LiveNowNav goLiveNow() {
    _Screens.graph.goFrom(_Screens.discover, _Screens.liveNow, null);
    return const LiveNowNav._();
  }

  NearbyNav goNearby() {
    _Screens.graph.goFrom(_Screens.discover, _Screens.nearby, null);
    return const NearbyNav._();
  }

  EventsNav goEvents() {
    _Screens.graph.goFrom(_Screens.discover, Events.events, null);
    return const EventsNav._();
  }
}

final class const TrendingNav._() extends AnyPlacement {
  this : super._();
  TrendingNav surface() {
    _Screens.graph.popTo(_Screens.trending);
    return const TrendingNav._();
  }

  HashtagNav goHashtag(String id) {
    _Screens.graph.goFrom(_Screens.trending, _Screens.hashtag, id);
    return const HashtagNav._();
  }

  TopicNav goTopic(String id) {
    _Screens.graph.goFrom(_Screens.trending, _Screens.topic, id);
    return const TopicNav._();
  }

  UserProfileNav2 goUserProfile(String id) {
    _Screens.graph.goFrom(_Screens.trending, _Screens.userProfile, id);
    return const UserProfileNav2._();
  }
}

final class const TopicsNav._() extends AnyPlacement {
  this : super._();
  TopicsNav surface() {
    _Screens.graph.popTo(_Screens.topics);
    return const TopicsNav._();
  }
}

final class const TopicNav._() extends AnyPlacement {
  this : super._();
  TopicNav surface() {
    _Screens.graph.popTo(_Screens.topic);
    return const TopicNav._();
  }

  SubtopicNav goSubtopic(String id) {
    _Screens.graph.goFrom(_Screens.topic, _Screens.subtopic, id);
    return const SubtopicNav._();
  }

  TopicNav goTopic(String id) {
    _Screens.graph.goFrom(_Screens.topic, _Screens.topic, id);
    return const TopicNav._();
  }
}

final class const SubtopicNav._() extends AnyPlacement {
  this : super._();
  SubtopicNav surface() {
    _Screens.graph.popTo(_Screens.subtopic);
    return const SubtopicNav._();
  }

  SubtopicNav goSubtopic(String id) {
    _Screens.graph.goFrom(_Screens.subtopic, _Screens.subtopic, id);
    return const SubtopicNav._();
  }

  TopicNav goTopic(String id) {
    _Screens.graph.goFrom(_Screens.subtopic, _Screens.topic, id);
    return const TopicNav._();
  }
}

final class const HashtagNav._() extends AnyPlacement {
  this : super._();
  HashtagNav surface() {
    _Screens.graph.popTo(_Screens.hashtag);
    return const HashtagNav._();
  }

  HashtagNav goHashtag(String id) {
    _Screens.graph.goFrom(_Screens.hashtag, _Screens.hashtag, id);
    return const HashtagNav._();
  }
}

final class const LiveNowNav._() extends AnyPlacement {
  this : super._();
  LiveNowNav surface() {
    _Screens.graph.popTo(_Screens.liveNow);
    return const LiveNowNav._();
  }

  LiveRoomNav goLiveRoom(String id) {
    _Screens.graph.goFrom(_Screens.liveNow, _Screens.liveRoom, id);
    return const LiveRoomNav._();
  }
}

final class const LiveRoomNav._() extends AnyPlacement {
  this : super._();
  LiveRoomNav surface() {
    _Screens.graph.popTo(_Screens.liveRoom);
    return const LiveRoomNav._();
  }

  LiveRoomNav goLiveRoom(String id) {
    _Screens.graph.goFrom(_Screens.liveRoom, _Screens.liveRoom, id);
    return const LiveRoomNav._();
  }
}

final class const NearbyNav._() extends AnyPlacement {
  this : super._();
  NearbyNav surface() {
    _Screens.graph.popTo(_Screens.nearby);
    return const NearbyNav._();
  }
}

final class const MarketplaceNav._() extends AnyPlacement {
  this : super._();
  MarketplaceNav surface() {
    _Screens.graph.popTo(_Screens.marketplace);
    return const MarketplaceNav._();
  }

  MarketplaceQueryMut get query => const MarketplaceQueryMut._();
  CategoriesNav goCategories() {
    _Screens.graph.goFrom(_Screens.marketplace, _Screens.categories, null);
    return const CategoriesNav._();
  }

  CartNav goCart() {
    _Screens.graph.goFrom(_Screens.marketplace, _Screens.cart, null);
    return const CartNav._();
  }

  MyOrdersNav goMyOrders() {
    _Screens.graph.goFrom(_Screens.marketplace, _Screens.myOrders, null);
    return const MyOrdersNav._();
  }

  WishlistNav goWishlist() {
    _Screens.graph.goFrom(_Screens.marketplace, _Screens.wishlist, null);
    return const WishlistNav._();
  }
}

final class const CategoriesNav._() extends AnyPlacement {
  this : super._();
  CategoriesNav surface() {
    _Screens.graph.popTo(_Screens.categories);
    return const CategoriesNav._();
  }

  CategoryNav goCategory(String id) {
    _Screens.graph.goFrom(_Screens.categories, _Screens.category, id);
    return const CategoryNav._();
  }
}

final class const CategoryNav._() extends AnyPlacement {
  this : super._();
  CategoryNav surface() {
    _Screens.graph.popTo(_Screens.category);
    return const CategoryNav._();
  }

  CategoryNav goCategory(String id) {
    _Screens.graph.goFrom(_Screens.category, _Screens.category, id);
    return const CategoryNav._();
  }

  ListingNav goListing(String id) {
    _Screens.graph.goFrom(_Screens.category, _Screens.listing, id);
    return const ListingNav._();
  }
}

final class const ListingNav._() extends AnyPlacement {
  this : super._();
  ListingNav surface() {
    _Screens.graph.popTo(_Screens.listing);
    return const ListingNav._();
  }

  EditListingNav goEditListing() {
    _Screens.graph.goFrom(
      _Screens.listing,
      _Screens.editListing,
      _idOf(_Screens.listing),
    );
    return const EditListingNav._();
  }

  SellerProfileNav goSellerProfile(String id) {
    _Screens.graph.goFrom(_Screens.listing, _Screens.sellerProfile, id);
    return const SellerProfileNav._();
  }

  ListingVariantNav goListingVariant(String id) {
    _Screens.graph.goFrom(_Screens.listing, _Screens.listingVariant, id);
    return const ListingVariantNav._();
  }

  ListingNav goListing(String id) {
    _Screens.graph.goFrom(_Screens.listing, _Screens.listing, id);
    return const ListingNav._();
  }
}

final class const ListingVariantNav._() extends AnyPlacement {
  this : super._();
  ListingVariantNav surface() {
    _Screens.graph.popTo(_Screens.listingVariant);
    return const ListingVariantNav._();
  }

  ListingVariantNav goListingVariant(String id) {
    _Screens.graph.goFrom(_Screens.listingVariant, _Screens.listingVariant, id);
    return const ListingVariantNav._();
  }
}

final class const EditListingNav._() extends AnyPlacement {
  this : super._();
  EditListingNav surface() {
    _Screens.graph.popTo(_Screens.editListing);
    return const EditListingNav._();
  }
}

final class const SellerProfileNav._() extends AnyPlacement {
  this : super._();
  SellerProfileNav surface() {
    _Screens.graph.popTo(_Screens.sellerProfile);
    return const SellerProfileNav._();
  }

  SellerProfileNav goSellerProfile(String id) {
    _Screens.graph.goFrom(_Screens.sellerProfile, _Screens.sellerProfile, id);
    return const SellerProfileNav._();
  }

  ListingNav goListing(String id) {
    _Screens.graph.goFrom(_Screens.sellerProfile, _Screens.listing, id);
    return const ListingNav._();
  }
}

final class const CartNav._() extends AnyPlacement {
  this : super._();
  CartNav surface() {
    _Screens.graph.popTo(_Screens.cart);
    return const CartNav._();
  }

  CheckoutNav goCheckout(String id) {
    _Screens.graph.goFrom(_Screens.cart, _Screens.checkout, id);
    return const CheckoutNav._();
  }
}

final class const CheckoutNav._() extends AnyPlacement {
  this : super._();
  CheckoutNav surface() {
    _Screens.graph.popTo(_Screens.checkout);
    return const CheckoutNav._();
  }

  OrderConfirmationNav goOrderConfirmation(String id) {
    _Screens.graph.goFrom(_Screens.checkout, _Screens.orderConfirmation, id);
    return const OrderConfirmationNav._();
  }
}

final class const OrderConfirmationNav._() extends AnyPlacement {
  this : super._();
  OrderConfirmationNav surface() {
    _Screens.graph.popTo(_Screens.orderConfirmation);
    return const OrderConfirmationNav._();
  }
}

final class const MyOrdersNav._() extends AnyPlacement {
  this : super._();
  MyOrdersNav surface() {
    _Screens.graph.popTo(_Screens.myOrders);
    return const MyOrdersNav._();
  }

  OrderNav goOrder(String id) {
    _Screens.graph.goFrom(_Screens.myOrders, _Screens.order, id);
    return const OrderNav._();
  }
}

final class const OrderNav._() extends AnyPlacement {
  this : super._();
  OrderNav surface() {
    _Screens.graph.popTo(_Screens.order);
    return const OrderNav._();
  }

  OrderNav goOrder(String id) {
    _Screens.graph.goFrom(_Screens.order, _Screens.order, id);
    return const OrderNav._();
  }
}

final class const WishlistNav._() extends AnyPlacement {
  this : super._();
  WishlistNav surface() {
    _Screens.graph.popTo(_Screens.wishlist);
    return const WishlistNav._();
  }
}

final class const MessagesNav._() extends AnyPlacement {
  this : super._();
  MessagesNav surface() {
    _Screens.graph.popTo(_Screens.messages);
    return const MessagesNav._();
  }

  ChatsNav goChats() {
    _Screens.graph.goFrom(_Screens.messages, _Screens.chats, null);
    return const ChatsNav._();
  }

  NewChatNav goNewChat() {
    _Screens.graph.goFrom(_Screens.messages, _Screens.newChat, null);
    return const NewChatNav._();
  }

  GroupChatNav goGroupChat(String id) {
    _Screens.graph.goFrom(_Screens.messages, _Screens.groupChat, id);
    return const GroupChatNav._();
  }
}

final class const ChatsNav._() extends AnyPlacement {
  this : super._();
  ChatsNav surface() {
    _Screens.graph.popTo(_Screens.chats);
    return const ChatsNav._();
  }

  ChatNav goChat(String id) {
    _Screens.graph.goFrom(_Screens.chats, _Screens.chat, id);
    return const ChatNav._();
  }
}

final class const ChatNav._() extends AnyPlacement {
  this : super._();
  ChatNav surface() {
    _Screens.graph.popTo(_Screens.chat);
    return const ChatNav._();
  }

  ThreadNav goThread(String id) {
    _Screens.graph.goFrom(_Screens.chat, _Screens.thread, id);
    return const ThreadNav._();
  }

  VoiceCallNav goVoiceCall() {
    _Screens.graph.goFrom(
      _Screens.chat,
      _Screens.voiceCall,
      _idOf(_Screens.chat),
    );
    return const VoiceCallNav._();
  }

  UserProfileNav3 goUserProfile(String id) {
    _Screens.graph.goFrom(_Screens.chat, _Screens.userProfile, id);
    return const UserProfileNav3._();
  }
}

final class const ThreadNav._() extends AnyPlacement {
  this : super._();
  ThreadNav surface() {
    _Screens.graph.popTo(_Screens.thread);
    return const ThreadNav._();
  }

  MessageNav goMessage(String id) {
    _Screens.graph.goFrom(_Screens.thread, _Screens.message, id);
    return const MessageNav._();
  }

  ThreadNav goThread(String id) {
    _Screens.graph.goFrom(_Screens.thread, _Screens.thread, id);
    return const ThreadNav._();
  }
}

final class const MessageNav._() extends AnyPlacement {
  this : super._();
  MessageNav surface() {
    _Screens.graph.popTo(_Screens.message);
    return const MessageNav._();
  }

  MessageReplyNav goMessageReply(String id) {
    _Screens.graph.goFrom(_Screens.message, _Screens.messageReply, id);
    return const MessageReplyNav._();
  }

  ChatNav goChat(String id) {
    _Screens.graph.goFrom(_Screens.message, _Screens.chat, id);
    return const ChatNav._();
  }
}

final class const MessageReplyNav._() extends AnyPlacement {
  this : super._();
  MessageReplyNav surface() {
    _Screens.graph.popTo(_Screens.messageReply);
    return const MessageReplyNav._();
  }

  MessageReplyNav goMessageReply(String id) {
    _Screens.graph.goFrom(_Screens.messageReply, _Screens.messageReply, id);
    return const MessageReplyNav._();
  }
}

final class const VoiceCallNav._() extends AnyPlacement {
  this : super._();
  VoiceCallNav surface() {
    _Screens.graph.popTo(_Screens.voiceCall);
    return const VoiceCallNav._();
  }
}

final class const NewChatNav._() extends AnyPlacement {
  this : super._();
  NewChatNav surface() {
    _Screens.graph.popTo(_Screens.newChat);
    return const NewChatNav._();
  }
}

final class const GroupChatNav._() extends AnyPlacement {
  this : super._();
  GroupChatNav surface() {
    _Screens.graph.popTo(_Screens.groupChat);
    return const GroupChatNav._();
  }

  GroupInfoNav goGroupInfo() {
    _Screens.graph.goFrom(
      _Screens.groupChat,
      _Screens.groupInfo,
      _idOf(_Screens.groupChat),
    );
    return const GroupInfoNav._();
  }

  GroupChatNav goGroupChat(String id) {
    _Screens.graph.goFrom(_Screens.groupChat, _Screens.groupChat, id);
    return const GroupChatNav._();
  }
}

final class const GroupInfoNav._() extends AnyPlacement {
  this : super._();
  GroupInfoNav surface() {
    _Screens.graph.popTo(_Screens.groupInfo);
    return const GroupInfoNav._();
  }
}

final class const WalletNav._() extends AnyPlacement {
  this : super._();
  WalletNav surface() {
    _Screens.graph.popTo(_Screens.wallet);
    return const WalletNav._();
  }

  BalanceNav goBalance() {
    _Screens.graph.goFrom(_Screens.wallet, _Screens.balance, null);
    return const BalanceNav._();
  }

  AccountsNav goAccounts() {
    _Screens.graph.goFrom(_Screens.wallet, _Screens.accounts, null);
    return const AccountsNav._();
  }

  SendMoneyNav goSendMoney() {
    _Screens.graph.goFrom(_Screens.wallet, _Screens.sendMoney, null);
    return const SendMoneyNav._();
  }

  ReceiveMoneyNav goReceiveMoney() {
    _Screens.graph.goFrom(_Screens.wallet, _Screens.receiveMoney, null);
    return const ReceiveMoneyNav._();
  }

  PaymentMethodsNav goPaymentMethods() {
    _Screens.graph.goFrom(_Screens.wallet, _Screens.paymentMethods, null);
    return const PaymentMethodsNav._();
  }
}

final class const BalanceNav._() extends AnyPlacement {
  this : super._();
  BalanceNav surface() {
    _Screens.graph.popTo(_Screens.balance);
    return const BalanceNav._();
  }
}

final class const AccountsNav._() extends AnyPlacement {
  this : super._();
  AccountsNav surface() {
    _Screens.graph.popTo(_Screens.accounts);
    return const AccountsNav._();
  }

  AccountNav goAccount(String id) {
    _Screens.graph.goFrom(_Screens.accounts, _Screens.account, id);
    return const AccountNav._();
  }
}

final class const AccountNav._() extends AnyPlacement {
  this : super._();
  AccountNav surface() {
    _Screens.graph.popTo(_Screens.account);
    return const AccountNav._();
  }

  TransactionsNav goTransactions() {
    _Screens.graph.goFrom(_Screens.account, _Screens.transactions, null);
    return const TransactionsNav._();
  }

  StatementsNav goStatements() {
    _Screens.graph.goFrom(_Screens.account, _Screens.statements, null);
    return const StatementsNav._();
  }

  AccountNav goAccount(String id) {
    _Screens.graph.goFrom(_Screens.account, _Screens.account, id);
    return const AccountNav._();
  }
}

final class const TransactionsNav._() extends AnyPlacement {
  this : super._();
  TransactionsNav surface() {
    _Screens.graph.popTo(_Screens.transactions);
    return const TransactionsNav._();
  }

  TransactionNav goTransaction(String id) {
    _Screens.graph.goFrom(_Screens.transactions, _Screens.transaction, id);
    return const TransactionNav._();
  }
}

final class const TransactionNav._() extends AnyPlacement {
  this : super._();
  TransactionNav surface() {
    _Screens.graph.popTo(_Screens.transaction);
    return const TransactionNav._();
  }

  TransactionItemNav goTransactionItem(String id) {
    _Screens.graph.goFrom(_Screens.transaction, _Screens.transactionItem, id);
    return const TransactionItemNav._();
  }

  TransactionNav goTransaction(String id) {
    _Screens.graph.goFrom(_Screens.transaction, _Screens.transaction, id);
    return const TransactionNav._();
  }
}

final class const TransactionItemNav._() extends AnyPlacement {
  this : super._();
  TransactionItemNav surface() {
    _Screens.graph.popTo(_Screens.transactionItem);
    return const TransactionItemNav._();
  }

  TransactionItemNav goTransactionItem(String id) {
    _Screens.graph.goFrom(
      _Screens.transactionItem,
      _Screens.transactionItem,
      id,
    );
    return const TransactionItemNav._();
  }
}

final class const SendMoneyNav._() extends AnyPlacement {
  this : super._();
  SendMoneyNav surface() {
    _Screens.graph.popTo(_Screens.sendMoney);
    return const SendMoneyNav._();
  }
}

final class const ReceiveMoneyNav._() extends AnyPlacement {
  this : super._();
  ReceiveMoneyNav surface() {
    _Screens.graph.popTo(_Screens.receiveMoney);
    return const ReceiveMoneyNav._();
  }
}

final class const PaymentMethodsNav._() extends AnyPlacement {
  this : super._();
  PaymentMethodsNav surface() {
    _Screens.graph.popTo(_Screens.paymentMethods);
    return const PaymentMethodsNav._();
  }

  AddCardNav goAddCard() {
    _Screens.graph.goFrom(_Screens.paymentMethods, _Screens.addCard, null);
    return const AddCardNav._();
  }

  CardNav goCard(String id) {
    _Screens.graph.goFrom(_Screens.paymentMethods, _Screens.card, id);
    return const CardNav._();
  }
}

final class const AddCardNav._() extends AnyPlacement {
  this : super._();
  AddCardNav surface() {
    _Screens.graph.popTo(_Screens.addCard);
    return const AddCardNav._();
  }
}

final class const CardNav._() extends AnyPlacement {
  this : super._();
  CardNav surface() {
    _Screens.graph.popTo(_Screens.card);
    return const CardNav._();
  }
}

final class const StatementsNav._() extends AnyPlacement {
  this : super._();
  StatementsNav surface() {
    _Screens.graph.popTo(_Screens.statements);
    return const StatementsNav._();
  }

  StatementNav goStatement(String id) {
    _Screens.graph.goFrom(_Screens.statements, _Screens.statement, id);
    return const StatementNav._();
  }
}

final class const StatementNav._() extends AnyPlacement {
  this : super._();
  StatementNav surface() {
    _Screens.graph.popTo(_Screens.statement);
    return const StatementNav._();
  }
}

final class const ProfileNav._() extends AnyPlacement {
  this : super._();
  ProfileNav surface() {
    _Screens.graph.popTo(_Screens.profile);
    return const ProfileNav._();
  }

  UserProfileNav4 goUserProfile(String id) {
    _Screens.graph.goFrom(_Screens.profile, _Screens.userProfile, id);
    return const UserProfileNav4._();
  }

  FollowersNav goFollowers(String id) {
    _Screens.graph.goFrom(_Screens.profile, _Screens.followers, id);
    return const FollowersNav._();
  }

  FollowingNav goFollowing(String id) {
    _Screens.graph.goFrom(_Screens.profile, _Screens.following, id);
    return const FollowingNav._();
  }

  EditProfileNav goEditProfile() {
    _Screens.graph.goFrom(_Screens.profile, _Screens.editProfile, null);
    return const EditProfileNav._();
  }

  AchievementsNav goAchievements() {
    _Screens.graph.goFrom(_Screens.profile, _Screens.achievements, null);
    return const AchievementsNav._();
  }

  BadgesNav goBadges() {
    _Screens.graph.goFrom(_Screens.profile, _Screens.badges, null);
    return const BadgesNav._();
  }

  SavedPostsNav goSavedPosts() {
    _Screens.graph.goFrom(_Screens.profile, _Screens.savedPosts, null);
    return const SavedPostsNav._();
  }

  DraftsNav goDrafts() {
    _Screens.graph.goFrom(_Screens.profile, _Screens.drafts, null);
    return const DraftsNav._();
  }

  MyListingsNav goMyListings() {
    _Screens.graph.goFrom(_Screens.profile, _Screens.myListings, null);
    return const MyListingsNav._();
  }
}

UserProfilePlacement _resolveUserProfilePlacement(List<Enum> c) {
  if (_chainIs(c, const [_Screens.home, _Screens.feed, _Screens.userProfile]))
    return const UserProfileNav1._();
  if (_chainIs(c, const [
    _Screens.discover,
    _Screens.trending,
    _Screens.userProfile,
  ]))
    return const UserProfileNav2._();
  if (_chainIs(c, const [
    _Screens.messages,
    _Screens.chats,
    _Screens.chat,
    _Screens.userProfile,
  ]))
    return const UserProfileNav3._();
  if (_chainIs(c, const [_Screens.profile, _Screens.userProfile]))
    return const UserProfileNav4._();
  if (_chainIs(c, const [
    _Screens.workspace,
    _Screens.project,
    _Screens.userProfile,
  ]))
    return const UserProfileNav5._();
  if (_chainIs(c, const [
    _Screens.forum,
    _Screens.forumCategory,
    _Screens.forumThread,
    _Screens.forumReply,
    _Screens.userProfile,
  ]))
    return const UserProfileNav6._();
  throw StateError('unresolved userProfile placement: $c');
}

sealed class UserProfilePlacement implements AnyPlacement {
  UserProfilePlacement surface();
}

final class const UserProfileNav1._()
    extends AnyPlacement
    implements UserProfilePlacement {
  this : super._();
  UserProfileNav1 surface() {
    _Screens.graph.popTo(_Screens.userProfile);
    return const UserProfileNav1._();
  }
}

final class const UserProfileNav2._()
    extends AnyPlacement
    implements UserProfilePlacement {
  this : super._();
  UserProfileNav2 surface() {
    _Screens.graph.popTo(_Screens.userProfile);
    return const UserProfileNav2._();
  }
}

final class const UserProfileNav3._()
    extends AnyPlacement
    implements UserProfilePlacement {
  this : super._();
  UserProfileNav3 surface() {
    _Screens.graph.popTo(_Screens.userProfile);
    return const UserProfileNav3._();
  }
}

final class const UserProfileNav4._()
    extends AnyPlacement
    implements UserProfilePlacement {
  this : super._();
  UserProfileNav4 surface() {
    _Screens.graph.popTo(_Screens.userProfile);
    return const UserProfileNav4._();
  }
}

final class const UserProfileNav5._()
    extends AnyPlacement
    implements UserProfilePlacement {
  this : super._();
  UserProfileNav5 surface() {
    _Screens.graph.popTo(_Screens.userProfile);
    return const UserProfileNav5._();
  }
}

final class const UserProfileNav6._()
    extends AnyPlacement
    implements UserProfilePlacement {
  this : super._();
  UserProfileNav6 surface() {
    _Screens.graph.popTo(_Screens.userProfile);
    return const UserProfileNav6._();
  }
}

final class const FollowersNav._() extends AnyPlacement {
  this : super._();
  FollowersNav surface() {
    _Screens.graph.popTo(_Screens.followers);
    return const FollowersNav._();
  }

  ConnectionNav goConnection(String id) {
    _Screens.graph.goFrom(_Screens.followers, _Screens.connection, id);
    return const ConnectionNav._();
  }
}

final class const FollowingNav._() extends AnyPlacement {
  this : super._();
  FollowingNav surface() {
    _Screens.graph.popTo(_Screens.following);
    return const FollowingNav._();
  }
}

final class const ConnectionNav._() extends AnyPlacement {
  this : super._();
  ConnectionNav surface() {
    _Screens.graph.popTo(_Screens.connection);
    return const ConnectionNav._();
  }

  ConnectionNav goConnection(String id) {
    _Screens.graph.goFrom(_Screens.connection, _Screens.connection, id);
    return const ConnectionNav._();
  }

  MutualConnectionsNav goMutualConnections() {
    _Screens.graph.goFrom(
      _Screens.connection,
      _Screens.mutualConnections,
      null,
    );
    return const MutualConnectionsNav._();
  }
}

final class const MutualConnectionsNav._() extends AnyPlacement {
  this : super._();
  MutualConnectionsNav surface() {
    _Screens.graph.popTo(_Screens.mutualConnections);
    return const MutualConnectionsNav._();
  }
}

final class const EditProfileNav._() extends AnyPlacement {
  this : super._();
  EditProfileNav surface() {
    _Screens.graph.popTo(_Screens.editProfile);
    return const EditProfileNav._();
  }
}

final class const AchievementsNav._() extends AnyPlacement {
  this : super._();
  AchievementsNav surface() {
    _Screens.graph.popTo(_Screens.achievements);
    return const AchievementsNav._();
  }
}

final class const BadgesNav._() extends AnyPlacement {
  this : super._();
  BadgesNav surface() {
    _Screens.graph.popTo(_Screens.badges);
    return const BadgesNav._();
  }

  BadgeNav goBadge(String id) {
    _Screens.graph.goFrom(_Screens.badges, _Screens.badge, id);
    return const BadgeNav._();
  }
}

final class const BadgeNav._() extends AnyPlacement {
  this : super._();
  BadgeNav surface() {
    _Screens.graph.popTo(_Screens.badge);
    return const BadgeNav._();
  }

  BadgeNav goBadge(String id) {
    _Screens.graph.goFrom(_Screens.badge, _Screens.badge, id);
    return const BadgeNav._();
  }
}

final class const SavedPostsNav._() extends AnyPlacement {
  this : super._();
  SavedPostsNav surface() {
    _Screens.graph.popTo(_Screens.savedPosts);
    return const SavedPostsNav._();
  }
}

final class const DraftsNav._() extends AnyPlacement {
  this : super._();
  DraftsNav surface() {
    _Screens.graph.popTo(_Screens.drafts);
    return const DraftsNav._();
  }
}

final class const MyListingsNav._() extends AnyPlacement {
  this : super._();
  MyListingsNav surface() {
    _Screens.graph.popTo(_Screens.myListings);
    return const MyListingsNav._();
  }
}

final class const NotificationsNav._() extends AnyPlacement {
  this : super._();
  NotificationsNav surface() {
    _Screens.graph.popTo(_Screens.notifications);
    return const NotificationsNav._();
  }

  NotificationSettingsNav goNotificationSettings() {
    _Screens.graph.goFrom(
      _Screens.notifications,
      _Screens.notificationSettings,
      null,
    );
    return const NotificationSettingsNav._();
  }
}

final class const NotificationSettingsNav._() extends AnyPlacement {
  this : super._();
  NotificationSettingsNav surface() {
    _Screens.graph.popTo(_Screens.notificationSettings);
    return const NotificationSettingsNav._();
  }
}

final class const SearchNav._() extends AnyPlacement {
  this : super._();
  SearchNav surface() {
    _Screens.graph.popTo(_Screens.search);
    return const SearchNav._();
  }

  SearchQueryMut get query => const SearchQueryMut._();
  SearchFragmentMut get fragment => const SearchFragmentMut._();
  SearchResultsNav goSearchResults() {
    _Screens.graph.goFrom(_Screens.search, _Screens.searchResults, null);
    return const SearchResultsNav._();
  }
}

final class const SearchResultsNav._() extends AnyPlacement {
  this : super._();
  SearchResultsNav surface() {
    _Screens.graph.popTo(_Screens.searchResults);
    return const SearchResultsNav._();
  }
}

final class const SettingsNav._() extends AnyPlacement {
  this : super._();
  SettingsNav surface() {
    _Screens.graph.popTo(_Screens.settings);
    return const SettingsNav._();
  }

  AccountSettingsNav goAccountSettings() {
    _Screens.graph.goFrom(_Screens.settings, _Screens.accountSettings, null);
    return const AccountSettingsNav._();
  }

  SecurityNav goSecurity() {
    _Screens.graph.goFrom(_Screens.settings, _Screens.security, null);
    return const SecurityNav._();
  }

  PrivacyNav goPrivacy() {
    _Screens.graph.goFrom(_Screens.settings, _Screens.privacy, null);
    return const PrivacyNav._();
  }

  AppearanceNav goAppearance() {
    _Screens.graph.goFrom(_Screens.settings, _Screens.appearance, null);
    return const AppearanceNav._();
  }

  LanguageNav goLanguage() {
    _Screens.graph.goFrom(_Screens.settings, _Screens.language, null);
    return const LanguageNav._();
  }

  ConnectedAppsNav goConnectedApps() {
    _Screens.graph.goFrom(_Screens.settings, _Screens.connectedApps, null);
    return const ConnectedAppsNav._();
  }

  AboutNav goAbout() {
    _Screens.graph.goFrom(_Screens.settings, _Screens.about, null);
    return const AboutNav._();
  }

  BlockedUsersNav goBlockedUsers() {
    _Screens.graph.goFrom(_Screens.settings, _Screens.blockedUsers, null);
    return const BlockedUsersNav._();
  }

  DevicesNav goDevices() {
    _Screens.graph.goFrom(_Screens.settings, _Screens.devices, null);
    return const DevicesNav._();
  }

  DataExportNav goDataExport() {
    _Screens.graph.goFrom(_Screens.settings, _Screens.dataExport, null);
    return const DataExportNav._();
  }

  DeleteAccountNav goDeleteAccount() {
    _Screens.graph.goFrom(_Screens.settings, _Screens.deleteAccount, null);
    return const DeleteAccountNav._();
  }

  IntegrationsNav goIntegrations() {
    _Screens.graph.goFrom(_Screens.settings, _Screens.integrations, null);
    return const IntegrationsNav._();
  }

  SupportNav goSupport() {
    _Screens.graph.goFrom(_Screens.settings, Support.support, null);
    return const SupportNav._();
  }

  AdminNav goAdmin() {
    _Screens.graph.goFrom(_Screens.settings, Admin.admin, null);
    return const AdminNav._();
  }
}

final class const AccountSettingsNav._() extends AnyPlacement {
  this : super._();
  AccountSettingsNav surface() {
    _Screens.graph.popTo(_Screens.accountSettings);
    return const AccountSettingsNav._();
  }
}

final class const SecurityNav._() extends AnyPlacement {
  this : super._();
  SecurityNav surface() {
    _Screens.graph.popTo(_Screens.security);
    return const SecurityNav._();
  }

  TwoFactorSettingsNav goTwoFactorSettings() {
    _Screens.graph.goFrom(_Screens.security, _Screens.twoFactorSettings, null);
    return const TwoFactorSettingsNav._();
  }
}

final class const TwoFactorSettingsNav._() extends AnyPlacement {
  this : super._();
  TwoFactorSettingsNav surface() {
    _Screens.graph.popTo(_Screens.twoFactorSettings);
    return const TwoFactorSettingsNav._();
  }
}

final class const PrivacyNav._() extends AnyPlacement {
  this : super._();
  PrivacyNav surface() {
    _Screens.graph.popTo(_Screens.privacy);
    return const PrivacyNav._();
  }
}

final class const AppearanceNav._() extends AnyPlacement {
  this : super._();
  AppearanceNav surface() {
    _Screens.graph.popTo(_Screens.appearance);
    return const AppearanceNav._();
  }
}

final class const LanguageNav._() extends AnyPlacement {
  this : super._();
  LanguageNav surface() {
    _Screens.graph.popTo(_Screens.language);
    return const LanguageNav._();
  }
}

final class const ConnectedAppsNav._() extends AnyPlacement {
  this : super._();
  ConnectedAppsNav surface() {
    _Screens.graph.popTo(_Screens.connectedApps);
    return const ConnectedAppsNav._();
  }
}

final class const AboutNav._() extends AnyPlacement {
  this : super._();
  AboutNav surface() {
    _Screens.graph.popTo(_Screens.about);
    return const AboutNav._();
  }

  HelpNav goHelp() {
    _Screens.graph.goFrom(_Screens.about, _Screens.help, null);
    return const HelpNav._();
  }

  FeedbackNav goFeedback() {
    _Screens.graph.goFrom(_Screens.about, _Screens.feedback, null);
    return const FeedbackNav._();
  }
}

final class const HelpNav._() extends AnyPlacement {
  this : super._();
  HelpNav surface() {
    _Screens.graph.popTo(_Screens.help);
    return const HelpNav._();
  }

  HelpCategoryNav goHelpCategory(String id) {
    _Screens.graph.goFrom(_Screens.help, _Screens.helpCategory, id);
    return const HelpCategoryNav._();
  }
}

final class const HelpCategoryNav._() extends AnyPlacement {
  this : super._();
  HelpCategoryNav surface() {
    _Screens.graph.popTo(_Screens.helpCategory);
    return const HelpCategoryNav._();
  }

  FaqNav goFaq() {
    _Screens.graph.goFrom(_Screens.helpCategory, _Screens.faq, null);
    return const FaqNav._();
  }
}

final class const FaqNav._() extends AnyPlacement {
  this : super._();
  FaqNav surface() {
    _Screens.graph.popTo(_Screens.faq);
    return const FaqNav._();
  }

  FaqArticleNav goFaqArticle(String id) {
    _Screens.graph.goFrom(_Screens.faq, _Screens.faqArticle, id);
    return const FaqArticleNav._();
  }
}

final class const FaqArticleNav._() extends AnyPlacement {
  this : super._();
  FaqArticleNav surface() {
    _Screens.graph.popTo(_Screens.faqArticle);
    return const FaqArticleNav._();
  }
}

final class const FeedbackNav._() extends AnyPlacement {
  this : super._();
  FeedbackNav surface() {
    _Screens.graph.popTo(_Screens.feedback);
    return const FeedbackNav._();
  }
}

final class const BlockedUsersNav._() extends AnyPlacement {
  this : super._();
  BlockedUsersNav surface() {
    _Screens.graph.popTo(_Screens.blockedUsers);
    return const BlockedUsersNav._();
  }
}

final class const DevicesNav._() extends AnyPlacement {
  this : super._();
  DevicesNav surface() {
    _Screens.graph.popTo(_Screens.devices);
    return const DevicesNav._();
  }

  DeviceNav goDevice(String id) {
    _Screens.graph.goFrom(_Screens.devices, _Screens.device, id);
    return const DeviceNav._();
  }
}

final class const DeviceNav._() extends AnyPlacement {
  this : super._();
  DeviceNav surface() {
    _Screens.graph.popTo(_Screens.device);
    return const DeviceNav._();
  }

  SessionsNav goSessions() {
    _Screens.graph.goFrom(_Screens.device, _Screens.sessions, null);
    return const SessionsNav._();
  }

  SessionNav goSession(String id) {
    _Screens.graph.goFrom(_Screens.device, _Screens.session, id);
    return const SessionNav._();
  }
}

final class const SessionsNav._() extends AnyPlacement {
  this : super._();
  SessionsNav surface() {
    _Screens.graph.popTo(_Screens.sessions);
    return const SessionsNav._();
  }
}

final class const SessionNav._() extends AnyPlacement {
  this : super._();
  SessionNav surface() {
    _Screens.graph.popTo(_Screens.session);
    return const SessionNav._();
  }

  SessionNav goSession(String id) {
    _Screens.graph.goFrom(_Screens.session, _Screens.session, id);
    return const SessionNav._();
  }
}

final class const DataExportNav._() extends AnyPlacement {
  this : super._();
  DataExportNav surface() {
    _Screens.graph.popTo(_Screens.dataExport);
    return const DataExportNav._();
  }
}

final class const DeleteAccountNav._() extends AnyPlacement {
  this : super._();
  DeleteAccountNav surface() {
    _Screens.graph.popTo(_Screens.deleteAccount);
    return const DeleteAccountNav._();
  }
}

final class const WorkspaceNav._() extends AnyPlacement {
  this : super._();
  WorkspaceNav surface() {
    _Screens.graph.popTo(_Screens.workspace);
    return const WorkspaceNav._();
  }

  WorkspaceQueryMut get query => const WorkspaceQueryMut._();
  ProjectNav goProject(String id) {
    _Screens.graph.goFrom(_Screens.workspace, _Screens.project, id);
    return const ProjectNav._();
  }
}

final class const ProjectNav._() extends AnyPlacement {
  this : super._();
  ProjectNav surface() {
    _Screens.graph.popTo(_Screens.project);
    return const ProjectNav._();
  }

  ProjectQueryMut get query => const ProjectQueryMut._();
  BoardNav goBoard(String id) {
    _Screens.graph.goFrom(_Screens.project, _Screens.board, id);
    return const BoardNav._();
  }

  UserProfileNav5 goUserProfile(String id) {
    _Screens.graph.goFrom(_Screens.project, _Screens.userProfile, id);
    return const UserProfileNav5._();
  }
}

final class const BoardNav._() extends AnyPlacement {
  this : super._();
  BoardNav surface() {
    _Screens.graph.popTo(_Screens.board);
    return const BoardNav._();
  }

  BoardQueryMut get query => const BoardQueryMut._();
  TaskListNav goTaskList(String id) {
    _Screens.graph.goFrom(_Screens.board, _Screens.taskList, id);
    return const TaskListNav._();
  }
}

final class const TaskListNav._() extends AnyPlacement {
  this : super._();
  TaskListNav surface() {
    _Screens.graph.popTo(_Screens.taskList);
    return const TaskListNav._();
  }

  TaskListQueryMut get query => const TaskListQueryMut._();
  TaskNav goTask(String id) {
    _Screens.graph.goFrom(_Screens.taskList, _Screens.task, id);
    return const TaskNav._();
  }

  MilestoneNav goMilestone(String id) {
    _Screens.graph.goFrom(_Screens.taskList, _Screens.milestone, id);
    return const MilestoneNav._();
  }

  SprintNav goSprint(String id) {
    _Screens.graph.goFrom(_Screens.taskList, _Screens.sprint, id);
    return const SprintNav._();
  }
}

final class const TaskNav._() extends AnyPlacement {
  this : super._();
  TaskNav surface() {
    _Screens.graph.popTo(_Screens.task);
    return const TaskNav._();
  }

  TaskQueryMut get query => const TaskQueryMut._();
  SubtaskNav goSubtask(String id) {
    _Screens.graph.goFrom(_Screens.task, _Screens.subtask, id);
    return const SubtaskNav._();
  }

  EditTaskNav goEditTask() {
    _Screens.graph.goFrom(
      _Screens.task,
      _Screens.editTask,
      _idOf(_Screens.task),
    );
    return const EditTaskNav._();
  }

  TaskCommentNav goTaskComment() {
    _Screens.graph.goFrom(
      _Screens.task,
      _Screens.taskComment,
      _idOf(_Screens.task),
    );
    return const TaskCommentNav._();
  }

  AssigneeNav goAssignee(String id) {
    _Screens.graph.goFrom(_Screens.task, _Screens.assignee, id);
    return const AssigneeNav._();
  }

  LabelNav goLabel(String id) {
    _Screens.graph.goFrom(_Screens.task, _Screens.label, id);
    return const LabelNav._();
  }

  TaskNav goTask(String id) {
    _Screens.graph.goFrom(_Screens.task, _Screens.task, id);
    return const TaskNav._();
  }
}

final class const SubtaskNav._() extends AnyPlacement {
  this : super._();
  SubtaskNav surface() {
    _Screens.graph.popTo(_Screens.subtask);
    return const SubtaskNav._();
  }

  ChecklistItemNav goChecklistItem(String id) {
    _Screens.graph.goFrom(_Screens.subtask, _Screens.checklistItem, id);
    return const ChecklistItemNav._();
  }

  SubtaskNav goSubtask(String id) {
    _Screens.graph.goFrom(_Screens.subtask, _Screens.subtask, id);
    return const SubtaskNav._();
  }
}

final class const ChecklistItemNav._() extends AnyPlacement {
  this : super._();
  ChecklistItemNav surface() {
    _Screens.graph.popTo(_Screens.checklistItem);
    return const ChecklistItemNav._();
  }

  ChecklistItemNav goChecklistItem(String id) {
    _Screens.graph.goFrom(_Screens.checklistItem, _Screens.checklistItem, id);
    return const ChecklistItemNav._();
  }
}

final class const EditTaskNav._() extends AnyPlacement {
  this : super._();
  EditTaskNav surface() {
    _Screens.graph.popTo(_Screens.editTask);
    return const EditTaskNav._();
  }
}

final class const TaskCommentNav._() extends AnyPlacement {
  this : super._();
  TaskCommentNav surface() {
    _Screens.graph.popTo(_Screens.taskComment);
    return const TaskCommentNav._();
  }
}

final class const AssigneeNav._() extends AnyPlacement {
  this : super._();
  AssigneeNav surface() {
    _Screens.graph.popTo(_Screens.assignee);
    return const AssigneeNav._();
  }
}

final class const LabelNav._() extends AnyPlacement {
  this : super._();
  LabelNav surface() {
    _Screens.graph.popTo(_Screens.label);
    return const LabelNav._();
  }
}

final class const MilestoneNav._() extends AnyPlacement {
  this : super._();
  MilestoneNav surface() {
    _Screens.graph.popTo(_Screens.milestone);
    return const MilestoneNav._();
  }
}

final class const SprintNav._() extends AnyPlacement {
  this : super._();
  SprintNav surface() {
    _Screens.graph.popTo(_Screens.sprint);
    return const SprintNav._();
  }
}

final class const ForumNav._() extends AnyPlacement {
  this : super._();
  ForumNav surface() {
    _Screens.graph.popTo(_Screens.forum);
    return const ForumNav._();
  }

  ForumCategoryNav goForumCategory(String id) {
    _Screens.graph.goFrom(_Screens.forum, _Screens.forumCategory, id);
    return const ForumCategoryNav._();
  }
}

final class const ForumCategoryNav._() extends AnyPlacement {
  this : super._();
  ForumCategoryNav surface() {
    _Screens.graph.popTo(_Screens.forumCategory);
    return const ForumCategoryNav._();
  }

  ForumCategoryQueryMut get query => const ForumCategoryQueryMut._();
  ForumThreadNav goForumThread(String id) {
    _Screens.graph.goFrom(_Screens.forumCategory, _Screens.forumThread, id);
    return const ForumThreadNav._();
  }
}

final class const ForumThreadNav._() extends AnyPlacement {
  this : super._();
  ForumThreadNav surface() {
    _Screens.graph.popTo(_Screens.forumThread);
    return const ForumThreadNav._();
  }

  ForumThreadQueryMut get query => const ForumThreadQueryMut._();
  ForumReplyNav goForumReply(String id) {
    _Screens.graph.goFrom(_Screens.forumThread, _Screens.forumReply, id);
    return const ForumReplyNav._();
  }

  ReportThreadNav goReportThread() {
    _Screens.graph.goFrom(
      _Screens.forumThread,
      _Screens.reportThread,
      _idOf(_Screens.forumThread),
    );
    return const ReportThreadNav._();
  }

  ForumThreadNav goForumThread(String id) {
    _Screens.graph.goFrom(_Screens.forumThread, _Screens.forumThread, id);
    return const ForumThreadNav._();
  }
}

final class const ForumReplyNav._() extends AnyPlacement {
  this : super._();
  ForumReplyNav surface() {
    _Screens.graph.popTo(_Screens.forumReply);
    return const ForumReplyNav._();
  }

  ForumReplyNav goForumReply(String id) {
    _Screens.graph.goFrom(_Screens.forumReply, _Screens.forumReply, id);
    return const ForumReplyNav._();
  }

  UserProfileNav6 goUserProfile(String id) {
    _Screens.graph.goFrom(_Screens.forumReply, _Screens.userProfile, id);
    return const UserProfileNav6._();
  }
}

final class const ReportThreadNav._() extends AnyPlacement {
  this : super._();
  ReportThreadNav surface() {
    _Screens.graph.popTo(_Screens.reportThread);
    return const ReportThreadNav._();
  }
}

final class const LearnNav._() extends AnyPlacement {
  this : super._();
  LearnNav surface() {
    _Screens.graph.popTo(_Screens.learn);
    return const LearnNav._();
  }

  CourseNav goCourse(String id) {
    _Screens.graph.goFrom(_Screens.learn, _Screens.course, id);
    return const CourseNav._();
  }
}

final class const CourseNav._() extends AnyPlacement {
  this : super._();
  CourseNav surface() {
    _Screens.graph.popTo(_Screens.course);
    return const CourseNav._();
  }

  CourseQueryMut get query => const CourseQueryMut._();
  CourseModuleNav goCourseModule(String id) {
    _Screens.graph.goFrom(_Screens.course, _Screens.courseModule, id);
    return const CourseModuleNav._();
  }

  CertificateNav goCertificate() {
    _Screens.graph.goFrom(
      _Screens.course,
      _Screens.certificate,
      _idOf(_Screens.course),
    );
    return const CertificateNav._();
  }
}

final class const CourseModuleNav._() extends AnyPlacement {
  this : super._();
  CourseModuleNav surface() {
    _Screens.graph.popTo(_Screens.courseModule);
    return const CourseModuleNav._();
  }

  LessonNav goLesson(String id) {
    _Screens.graph.goFrom(_Screens.courseModule, _Screens.lesson, id);
    return const LessonNav._();
  }

  InstructorNav goInstructor(String id) {
    _Screens.graph.goFrom(_Screens.courseModule, _Screens.instructor, id);
    return const InstructorNav._();
  }
}

final class const LessonNav._() extends AnyPlacement {
  this : super._();
  LessonNav surface() {
    _Screens.graph.popTo(_Screens.lesson);
    return const LessonNav._();
  }

  QuizNav goQuiz(String id) {
    _Screens.graph.goFrom(_Screens.lesson, _Screens.quiz, id);
    return const QuizNav._();
  }

  CourseReviewNav goCourseReview(String id) {
    _Screens.graph.goFrom(_Screens.lesson, _Screens.courseReview, id);
    return const CourseReviewNav._();
  }
}

final class const QuizNav._() extends AnyPlacement {
  this : super._();
  QuizNav surface() {
    _Screens.graph.popTo(_Screens.quiz);
    return const QuizNav._();
  }

  QuestionNav goQuestion(String id) {
    _Screens.graph.goFrom(_Screens.quiz, _Screens.question, id);
    return const QuestionNav._();
  }
}

final class const QuestionNav._() extends AnyPlacement {
  this : super._();
  QuestionNav surface() {
    _Screens.graph.popTo(_Screens.question);
    return const QuestionNav._();
  }

  QuestionNav goQuestion(String id) {
    _Screens.graph.goFrom(_Screens.question, _Screens.question, id);
    return const QuestionNav._();
  }

  AnswerNav goAnswer() {
    _Screens.graph.goFrom(
      _Screens.question,
      _Screens.answer,
      _idOf(_Screens.question),
    );
    return const AnswerNav._();
  }
}

final class const AnswerNav._() extends AnyPlacement {
  this : super._();
  AnswerNav surface() {
    _Screens.graph.popTo(_Screens.answer);
    return const AnswerNav._();
  }
}

final class const CourseReviewNav._() extends AnyPlacement {
  this : super._();
  CourseReviewNav surface() {
    _Screens.graph.popTo(_Screens.courseReview);
    return const CourseReviewNav._();
  }
}

final class const InstructorNav._() extends AnyPlacement {
  this : super._();
  InstructorNav surface() {
    _Screens.graph.popTo(_Screens.instructor);
    return const InstructorNav._();
  }
}

final class const CertificateNav._() extends AnyPlacement {
  this : super._();
  CertificateNav surface() {
    _Screens.graph.popTo(_Screens.certificate);
    return const CertificateNav._();
  }
}

final class const ShopNav._() extends AnyPlacement {
  this : super._();
  ShopNav surface() {
    _Screens.graph.popTo(_Screens.shop);
    return const ShopNav._();
  }

  ShopDeptNav goShopDept(String id) {
    _Screens.graph.goFrom(_Screens.shop, _Screens.shopDept, id);
    return const ShopDeptNav._();
  }

  CompareProductsNav goCompareProducts() {
    _Screens.graph.goFrom(_Screens.shop, _Screens.compareProducts, null);
    return const CompareProductsNav._();
  }
}

final class const ShopDeptNav._() extends AnyPlacement {
  this : super._();
  ShopDeptNav surface() {
    _Screens.graph.popTo(_Screens.shopDept);
    return const ShopDeptNav._();
  }

  ShopCategoryNav goShopCategory(String id) {
    _Screens.graph.goFrom(_Screens.shopDept, _Screens.shopCategory, id);
    return const ShopCategoryNav._();
  }
}

final class const ShopCategoryNav._() extends AnyPlacement {
  this : super._();
  ShopCategoryNav surface() {
    _Screens.graph.popTo(_Screens.shopCategory);
    return const ShopCategoryNav._();
  }

  ShopSubcategoryNav goShopSubcategory(String id) {
    _Screens.graph.goFrom(_Screens.shopCategory, _Screens.shopSubcategory, id);
    return const ShopSubcategoryNav._();
  }
}

final class const ShopSubcategoryNav._() extends AnyPlacement {
  this : super._();
  ShopSubcategoryNav surface() {
    _Screens.graph.popTo(_Screens.shopSubcategory);
    return const ShopSubcategoryNav._();
  }

  ShopSubcategoryQueryMut get query => const ShopSubcategoryQueryMut._();
  ProductNav goProduct(String id) {
    _Screens.graph.goFrom(_Screens.shopSubcategory, _Screens.product, id);
    return const ProductNav._();
  }
}

final class const ProductNav._() extends AnyPlacement {
  this : super._();
  ProductNav surface() {
    _Screens.graph.popTo(_Screens.product);
    return const ProductNav._();
  }

  ProductQueryMut get query => const ProductQueryMut._();
  ProductVariantNav goProductVariant(String id) {
    _Screens.graph.goFrom(_Screens.product, _Screens.productVariant, id);
    return const ProductVariantNav._();
  }

  ProductReviewNav goProductReview(String id) {
    _Screens.graph.goFrom(_Screens.product, _Screens.productReview, id);
    return const ProductReviewNav._();
  }

  BrandNav goBrand(String id) {
    _Screens.graph.goFrom(_Screens.product, _Screens.brand, id);
    return const BrandNav._();
  }

  ProductNav goProduct(String id) {
    _Screens.graph.goFrom(_Screens.product, _Screens.product, id);
    return const ProductNav._();
  }
}

final class const ProductVariantNav._() extends AnyPlacement {
  this : super._();
  ProductVariantNav surface() {
    _Screens.graph.popTo(_Screens.productVariant);
    return const ProductVariantNav._();
  }

  ProductVariantNav goProductVariant(String id) {
    _Screens.graph.goFrom(_Screens.productVariant, _Screens.productVariant, id);
    return const ProductVariantNav._();
  }
}

final class const ProductReviewNav._() extends AnyPlacement {
  this : super._();
  ProductReviewNav surface() {
    _Screens.graph.popTo(_Screens.productReview);
    return const ProductReviewNav._();
  }
}

final class const BrandNav._() extends AnyPlacement {
  this : super._();
  BrandNav surface() {
    _Screens.graph.popTo(_Screens.brand);
    return const BrandNav._();
  }
}

final class const CompareProductsNav._() extends AnyPlacement {
  this : super._();
  CompareProductsNav surface() {
    _Screens.graph.popTo(_Screens.compareProducts);
    return const CompareProductsNav._();
  }
}

final class const ActivityNav._() extends AnyPlacement {
  this : super._();
  ActivityNav surface() {
    _Screens.graph.popTo(_Screens.activity);
    return const ActivityNav._();
  }

  WorkoutNav goWorkout(String id) {
    _Screens.graph.goFrom(_Screens.activity, _Screens.workout, id);
    return const WorkoutNav._();
  }
}

final class const WorkoutNav._() extends AnyPlacement {
  this : super._();
  WorkoutNav surface() {
    _Screens.graph.popTo(_Screens.workout);
    return const WorkoutNav._();
  }

  WorkoutQueryMut get query => const WorkoutQueryMut._();
  ExerciseNav goExercise(String id) {
    _Screens.graph.goFrom(_Screens.workout, _Screens.exercise, id);
    return const ExerciseNav._();
  }
}

final class const ExerciseNav._() extends AnyPlacement {
  this : super._();
  ExerciseNav surface() {
    _Screens.graph.popTo(_Screens.exercise);
    return const ExerciseNav._();
  }

  ExerciseSetNav goExerciseSet(String id) {
    _Screens.graph.goFrom(_Screens.exercise, _Screens.exerciseSet, id);
    return const ExerciseSetNav._();
  }
}

final class const ExerciseSetNav._() extends AnyPlacement {
  this : super._();
  ExerciseSetNav surface() {
    _Screens.graph.popTo(_Screens.exerciseSet);
    return const ExerciseSetNav._();
  }

  ExerciseSetNav goExerciseSet(String id) {
    _Screens.graph.goFrom(_Screens.exerciseSet, _Screens.exerciseSet, id);
    return const ExerciseSetNav._();
  }
}

final class const DeepDemoNav._() extends AnyPlacement {
  this : super._();
  DeepDemoNav surface() {
    _Screens.graph.popTo(_Screens.deepDemo);
    return const DeepDemoNav._();
  }

  LevelANav goLevelA(String id) {
    _Screens.graph.goFrom(_Screens.deepDemo, _Screens.levelA, id);
    return const LevelANav._();
  }
}

final class const LevelANav._() extends AnyPlacement {
  this : super._();
  LevelANav surface() {
    _Screens.graph.popTo(_Screens.levelA);
    return const LevelANav._();
  }

  LevelBNav goLevelB(String id) {
    _Screens.graph.goFrom(_Screens.levelA, _Screens.levelB, id);
    return const LevelBNav._();
  }
}

final class const LevelBNav._() extends AnyPlacement {
  this : super._();
  LevelBNav surface() {
    _Screens.graph.popTo(_Screens.levelB);
    return const LevelBNav._();
  }

  LevelCNav goLevelC(String id) {
    _Screens.graph.goFrom(_Screens.levelB, _Screens.levelC, id);
    return const LevelCNav._();
  }
}

final class const LevelCNav._() extends AnyPlacement {
  this : super._();
  LevelCNav surface() {
    _Screens.graph.popTo(_Screens.levelC);
    return const LevelCNav._();
  }

  LevelDNav goLevelD(String id) {
    _Screens.graph.goFrom(_Screens.levelC, _Screens.levelD, id);
    return const LevelDNav._();
  }
}

final class const LevelDNav._() extends AnyPlacement {
  this : super._();
  LevelDNav surface() {
    _Screens.graph.popTo(_Screens.levelD);
    return const LevelDNav._();
  }

  LevelENav goLevelE(String id) {
    _Screens.graph.goFrom(_Screens.levelD, _Screens.levelE, id);
    return const LevelENav._();
  }
}

final class const LevelENav._() extends AnyPlacement {
  this : super._();
  LevelENav surface() {
    _Screens.graph.popTo(_Screens.levelE);
    return const LevelENav._();
  }

  LevelFNav goLevelF(String id) {
    _Screens.graph.goFrom(_Screens.levelE, _Screens.levelF, id);
    return const LevelFNav._();
  }
}

final class const LevelFNav._() extends AnyPlacement {
  this : super._();
  LevelFNav surface() {
    _Screens.graph.popTo(_Screens.levelF);
    return const LevelFNav._();
  }

  LevelANav goLevelA(String id) {
    _Screens.graph.goFrom(_Screens.levelF, _Screens.levelA, id);
    return const LevelANav._();
  }

  LevelBNav goLevelB(String id) {
    _Screens.graph.goFrom(_Screens.levelF, _Screens.levelB, id);
    return const LevelBNav._();
  }

  LevelCNav goLevelC(String id) {
    _Screens.graph.goFrom(_Screens.levelF, _Screens.levelC, id);
    return const LevelCNav._();
  }

  LevelDNav goLevelD(String id) {
    _Screens.graph.goFrom(_Screens.levelF, _Screens.levelD, id);
    return const LevelDNav._();
  }

  LevelENav goLevelE(String id) {
    _Screens.graph.goFrom(_Screens.levelF, _Screens.levelE, id);
    return const LevelENav._();
  }

  LevelFNav goLevelF(String id) {
    _Screens.graph.goFrom(_Screens.levelF, _Screens.levelF, id);
    return const LevelFNav._();
  }
}

final class const IntegrationsNav._() extends AnyPlacement {
  this : super._();
  IntegrationsNav surface() {
    _Screens.graph.popTo(_Screens.integrations);
    return const IntegrationsNav._();
  }

  ApiKeysNav goApiKeys() {
    _Screens.graph.goFrom(_Screens.integrations, _Screens.apiKeys, null);
    return const ApiKeysNav._();
  }
}

final class const ApiKeysNav._() extends AnyPlacement {
  this : super._();
  ApiKeysNav surface() {
    _Screens.graph.popTo(_Screens.apiKeys);
    return const ApiKeysNav._();
  }
}

final class const StudioNav._() extends AnyPlacement {
  this : super._();
  StudioNav surface() {
    _Screens.graph.popTo(CreatorStudio.studio);
    return const StudioNav._();
  }

  AnalyticsNav goAnalytics() {
    _Screens.graph.goFrom(CreatorStudio.studio, CreatorStudio.analytics, null);
    return const AnalyticsNav._();
  }

  ScheduledNav goScheduled() {
    _Screens.graph.goFrom(CreatorStudio.studio, CreatorStudio.scheduled, null);
    return const ScheduledNav._();
  }

  MonetizationNav goMonetization() {
    _Screens.graph.goFrom(
      CreatorStudio.studio,
      CreatorStudio.monetization,
      null,
    );
    return const MonetizationNav._();
  }
}

final class const AnalyticsNav._() extends AnyPlacement {
  this : super._();
  AnalyticsNav surface() {
    _Screens.graph.popTo(CreatorStudio.analytics);
    return const AnalyticsNav._();
  }

  AudienceNav goAudience() {
    _Screens.graph.goFrom(
      CreatorStudio.analytics,
      CreatorStudio.audience,
      null,
    );
    return const AudienceNav._();
  }
}

final class const AudienceNav._() extends AnyPlacement {
  this : super._();
  AudienceNav surface() {
    _Screens.graph.popTo(CreatorStudio.audience);
    return const AudienceNav._();
  }
}

final class const ScheduledNav._() extends AnyPlacement {
  this : super._();
  ScheduledNav surface() {
    _Screens.graph.popTo(CreatorStudio.scheduled);
    return const ScheduledNav._();
  }

  ScheduledPostNav goScheduledPost(String id) {
    _Screens.graph.goFrom(
      CreatorStudio.scheduled,
      CreatorStudio.scheduledPost,
      id,
    );
    return const ScheduledPostNav._();
  }
}

final class const ScheduledPostNav._() extends AnyPlacement {
  this : super._();
  ScheduledPostNav surface() {
    _Screens.graph.popTo(CreatorStudio.scheduledPost);
    return const ScheduledPostNav._();
  }

  EditScheduledNav goEditScheduled() {
    _Screens.graph.goFrom(
      CreatorStudio.scheduledPost,
      CreatorStudio.editScheduled,
      _idOf(CreatorStudio.scheduledPost),
    );
    return const EditScheduledNav._();
  }
}

final class const EditScheduledNav._() extends AnyPlacement {
  this : super._();
  EditScheduledNav surface() {
    _Screens.graph.popTo(CreatorStudio.editScheduled);
    return const EditScheduledNav._();
  }
}

final class const MonetizationNav._() extends AnyPlacement {
  this : super._();
  MonetizationNav surface() {
    _Screens.graph.popTo(CreatorStudio.monetization);
    return const MonetizationNav._();
  }

  PayoutsNav goPayouts() {
    _Screens.graph.goFrom(
      CreatorStudio.monetization,
      CreatorStudio.payouts,
      null,
    );
    return const PayoutsNav._();
  }
}

final class const PayoutsNav._() extends AnyPlacement {
  this : super._();
  PayoutsNav surface() {
    _Screens.graph.popTo(CreatorStudio.payouts);
    return const PayoutsNav._();
  }
}

final class const EventsNav._() extends AnyPlacement {
  this : super._();
  EventsNav surface() {
    _Screens.graph.popTo(Events.events);
    return const EventsNav._();
  }

  EventNav goEvent(String id) {
    _Screens.graph.goFrom(Events.events, Events.event, id);
    return const EventNav._();
  }

  CreateEventNav goCreateEvent() {
    _Screens.graph.goFrom(Events.events, Events.createEvent, null);
    return const CreateEventNav._();
  }
}

final class const EventNav._() extends AnyPlacement {
  this : super._();
  EventNav surface() {
    _Screens.graph.popTo(Events.event);
    return const EventNav._();
  }

  AttendeesNav goAttendees() {
    _Screens.graph.goFrom(Events.event, Events.attendees, _idOf(Events.event));
    return const AttendeesNav._();
  }

  EditEventNav goEditEvent() {
    _Screens.graph.goFrom(Events.event, Events.editEvent, _idOf(Events.event));
    return const EditEventNav._();
  }

  TicketsNav goTickets() {
    _Screens.graph.goFrom(Events.event, Events.tickets, _idOf(Events.event));
    return const TicketsNav._();
  }
}

final class const AttendeesNav._() extends AnyPlacement {
  this : super._();
  AttendeesNav surface() {
    _Screens.graph.popTo(Events.attendees);
    return const AttendeesNav._();
  }
}

final class const EditEventNav._() extends AnyPlacement {
  this : super._();
  EditEventNav surface() {
    _Screens.graph.popTo(Events.editEvent);
    return const EditEventNav._();
  }
}

final class const CreateEventNav._() extends AnyPlacement {
  this : super._();
  CreateEventNav surface() {
    _Screens.graph.popTo(Events.createEvent);
    return const CreateEventNav._();
  }
}

final class const TicketsNav._() extends AnyPlacement {
  this : super._();
  TicketsNav surface() {
    _Screens.graph.popTo(Events.tickets);
    return const TicketsNav._();
  }
}

final class const SupportNav._() extends AnyPlacement {
  this : super._();
  SupportNav surface() {
    _Screens.graph.popTo(Support.support);
    return const SupportNav._();
  }

  SupportTicketsNav goSupportTickets() {
    _Screens.graph.goFrom(Support.support, Support.supportTickets, null);
    return const SupportTicketsNav._();
  }

  NewTicketNav goNewTicket() {
    _Screens.graph.goFrom(Support.support, Support.newTicket, null);
    return const NewTicketNav._();
  }

  KnowledgeBaseNav goKnowledgeBase() {
    _Screens.graph.goFrom(Support.support, Support.knowledgeBase, null);
    return const KnowledgeBaseNav._();
  }
}

final class const SupportTicketsNav._() extends AnyPlacement {
  this : super._();
  SupportTicketsNav surface() {
    _Screens.graph.popTo(Support.supportTickets);
    return const SupportTicketsNav._();
  }

  SupportTicketNav goSupportTicket(String id) {
    _Screens.graph.goFrom(Support.supportTickets, Support.supportTicket, id);
    return const SupportTicketNav._();
  }
}

final class const SupportTicketNav._() extends AnyPlacement {
  this : super._();
  SupportTicketNav surface() {
    _Screens.graph.popTo(Support.supportTicket);
    return const SupportTicketNav._();
  }
}

final class const NewTicketNav._() extends AnyPlacement {
  this : super._();
  NewTicketNav surface() {
    _Screens.graph.popTo(Support.newTicket);
    return const NewTicketNav._();
  }
}

final class const KnowledgeBaseNav._() extends AnyPlacement {
  this : super._();
  KnowledgeBaseNav surface() {
    _Screens.graph.popTo(Support.knowledgeBase);
    return const KnowledgeBaseNav._();
  }

  ArticleNav goArticle(String id) {
    _Screens.graph.goFrom(Support.knowledgeBase, Support.article, id);
    return const ArticleNav._();
  }
}

final class const ArticleNav._() extends AnyPlacement {
  this : super._();
  ArticleNav surface() {
    _Screens.graph.popTo(Support.article);
    return const ArticleNav._();
  }
}

final class const AdminNav._() extends AnyPlacement {
  this : super._();
  AdminNav surface() {
    _Screens.graph.popTo(Admin.admin);
    return const AdminNav._();
  }

  AdminUsersNav goAdminUsers() {
    _Screens.graph.goFrom(Admin.admin, Admin.adminUsers, null);
    return const AdminUsersNav._();
  }

  AdminAuditLogNav goAdminAuditLog() {
    _Screens.graph.goFrom(Admin.admin, Admin.adminAuditLog, null);
    return const AdminAuditLogNav._();
  }

  AdminFeatureFlagsNav goAdminFeatureFlags() {
    _Screens.graph.goFrom(Admin.admin, Admin.adminFeatureFlags, null);
    return const AdminFeatureFlagsNav._();
  }

  WebhooksNav goWebhooks() {
    _Screens.graph.goFrom(Admin.admin, Admin.webhooks, null);
    return const WebhooksNav._();
  }
}

final class const AdminUsersNav._() extends AnyPlacement {
  this : super._();
  AdminUsersNav surface() {
    _Screens.graph.popTo(Admin.adminUsers);
    return const AdminUsersNav._();
  }

  AdminUserNav goAdminUser(String id) {
    _Screens.graph.goFrom(Admin.adminUsers, Admin.adminUser, id);
    return const AdminUserNav._();
  }
}

final class const AdminUserNav._() extends AnyPlacement {
  this : super._();
  AdminUserNav surface() {
    _Screens.graph.popTo(Admin.adminUser);
    return const AdminUserNav._();
  }

  AdminRoleNav goAdminRole(String id) {
    _Screens.graph.goFrom(Admin.adminUser, Admin.adminRole, id);
    return const AdminRoleNav._();
  }
}

final class const AdminAuditLogNav._() extends AnyPlacement {
  this : super._();
  AdminAuditLogNav surface() {
    _Screens.graph.popTo(Admin.adminAuditLog);
    return const AdminAuditLogNav._();
  }
}

final class const AdminRoleNav._() extends AnyPlacement {
  this : super._();
  AdminRoleNav surface() {
    _Screens.graph.popTo(Admin.adminRole);
    return const AdminRoleNav._();
  }
}

final class const AdminFeatureFlagsNav._() extends AnyPlacement {
  this : super._();
  AdminFeatureFlagsNav surface() {
    _Screens.graph.popTo(Admin.adminFeatureFlags);
    return const AdminFeatureFlagsNav._();
  }
}

final class const WebhooksNav._() extends AnyPlacement {
  this : super._();
  WebhooksNav surface() {
    _Screens.graph.popTo(Admin.webhooks);
    return const WebhooksNav._();
  }

  WebhookNav goWebhook(String id) {
    _Screens.graph.goFrom(Admin.webhooks, Admin.webhook, id);
    return const WebhookNav._();
  }
}

final class const WebhookNav._() extends AnyPlacement {
  this : super._();
  WebhookNav surface() {
    _Screens.graph.popTo(Admin.webhook);
    return const WebhookNav._();
  }
}

extension type const ScreenId<I>._(Enum spec) {
  static const resetPassword = ScreenId<String>._(_Screens.resetPassword);
  static const story = ScreenId<String>._(_Screens.story);
  static const post = ScreenId<String>._(_Screens.post);
  static const comment = ScreenId<String>._(_Screens.comment);
  static const postAuthor = ScreenId<String>._(_Screens.postAuthor);
  static const postComments = ScreenId<String>._(_Screens.postComments);
  static const postLikes = ScreenId<String>._(_Screens.postLikes);
  static const editPost = ScreenId<String>._(_Screens.editPost);
  static const repost = ScreenId<String>._(_Screens.repost);
  static const topic = ScreenId<String>._(_Screens.topic);
  static const subtopic = ScreenId<String>._(_Screens.subtopic);
  static const hashtag = ScreenId<String>._(_Screens.hashtag);
  static const liveRoom = ScreenId<String>._(_Screens.liveRoom);
  static const category = ScreenId<String>._(_Screens.category);
  static const listing = ScreenId<String>._(_Screens.listing);
  static const listingVariant = ScreenId<String>._(_Screens.listingVariant);
  static const editListing = ScreenId<String>._(_Screens.editListing);
  static const sellerProfile = ScreenId<String>._(_Screens.sellerProfile);
  static const checkout = ScreenId<String>._(_Screens.checkout);
  static const orderConfirmation = ScreenId<String>._(
    _Screens.orderConfirmation,
  );
  static const order = ScreenId<String>._(_Screens.order);
  static const chat = ScreenId<String>._(_Screens.chat);
  static const thread = ScreenId<String>._(_Screens.thread);
  static const message = ScreenId<String>._(_Screens.message);
  static const messageReply = ScreenId<String>._(_Screens.messageReply);
  static const voiceCall = ScreenId<String>._(_Screens.voiceCall);
  static const groupChat = ScreenId<String>._(_Screens.groupChat);
  static const groupInfo = ScreenId<String>._(_Screens.groupInfo);
  static const account = ScreenId<String>._(_Screens.account);
  static const transaction = ScreenId<String>._(_Screens.transaction);
  static const transactionItem = ScreenId<String>._(_Screens.transactionItem);
  static const card = ScreenId<String>._(_Screens.card);
  static const statement = ScreenId<String>._(_Screens.statement);
  static const userProfile = ScreenId<String>._(_Screens.userProfile);
  static const followers = ScreenId<String>._(_Screens.followers);
  static const following = ScreenId<String>._(_Screens.following);
  static const connection = ScreenId<String>._(_Screens.connection);
  static const badge = ScreenId<String>._(_Screens.badge);
  static const helpCategory = ScreenId<String>._(_Screens.helpCategory);
  static const faqArticle = ScreenId<String>._(_Screens.faqArticle);
  static const device = ScreenId<String>._(_Screens.device);
  static const session = ScreenId<String>._(_Screens.session);
  static const project = ScreenId<String>._(_Screens.project);
  static const board = ScreenId<String>._(_Screens.board);
  static const taskList = ScreenId<String>._(_Screens.taskList);
  static const task = ScreenId<String>._(_Screens.task);
  static const subtask = ScreenId<String>._(_Screens.subtask);
  static const checklistItem = ScreenId<String>._(_Screens.checklistItem);
  static const editTask = ScreenId<String>._(_Screens.editTask);
  static const taskComment = ScreenId<String>._(_Screens.taskComment);
  static const assignee = ScreenId<String>._(_Screens.assignee);
  static const label = ScreenId<String>._(_Screens.label);
  static const milestone = ScreenId<String>._(_Screens.milestone);
  static const sprint = ScreenId<String>._(_Screens.sprint);
  static const forumCategory = ScreenId<String>._(_Screens.forumCategory);
  static const forumThread = ScreenId<String>._(_Screens.forumThread);
  static const forumReply = ScreenId<String>._(_Screens.forumReply);
  static const reportThread = ScreenId<String>._(_Screens.reportThread);
  static const course = ScreenId<String>._(_Screens.course);
  static const courseModule = ScreenId<String>._(_Screens.courseModule);
  static const lesson = ScreenId<String>._(_Screens.lesson);
  static const quiz = ScreenId<String>._(_Screens.quiz);
  static const question = ScreenId<String>._(_Screens.question);
  static const answer = ScreenId<String>._(_Screens.answer);
  static const courseReview = ScreenId<String>._(_Screens.courseReview);
  static const instructor = ScreenId<String>._(_Screens.instructor);
  static const certificate = ScreenId<String>._(_Screens.certificate);
  static const shopDept = ScreenId<String>._(_Screens.shopDept);
  static const shopCategory = ScreenId<String>._(_Screens.shopCategory);
  static const shopSubcategory = ScreenId<String>._(_Screens.shopSubcategory);
  static const product = ScreenId<String>._(_Screens.product);
  static const productVariant = ScreenId<String>._(_Screens.productVariant);
  static const productReview = ScreenId<String>._(_Screens.productReview);
  static const brand = ScreenId<String>._(_Screens.brand);
  static const workout = ScreenId<String>._(_Screens.workout);
  static const exercise = ScreenId<String>._(_Screens.exercise);
  static const exerciseSet = ScreenId<String>._(_Screens.exerciseSet);
  static const levelA = ScreenId<String>._(_Screens.levelA);
  static const levelB = ScreenId<String>._(_Screens.levelB);
  static const levelC = ScreenId<String>._(_Screens.levelC);
  static const levelD = ScreenId<String>._(_Screens.levelD);
  static const levelE = ScreenId<String>._(_Screens.levelE);
  static const levelF = ScreenId<String>._(_Screens.levelF);
  static const scheduledPost = ScreenId<String>._(CreatorStudio.scheduledPost);
  static const editScheduled = ScreenId<String>._(CreatorStudio.editScheduled);
  static const event = ScreenId<String>._(Events.event);
  static const attendees = ScreenId<String>._(Events.attendees);
  static const editEvent = ScreenId<String>._(Events.editEvent);
  static const tickets = ScreenId<String>._(Events.tickets);
  static const supportTicket = ScreenId<String>._(Support.supportTicket);
  static const article = ScreenId<String>._(Support.article);
  static const adminUser = ScreenId<String>._(Admin.adminUser);
  static const adminRole = ScreenId<String>._(Admin.adminRole);
  static const webhook = ScreenId<String>._(Admin.webhook);
}

extension ScreenIdOf on BuildContext {
  I idOf<I>(ScreenId<I> screen) => ScreenScope.idOf<I>(this, screen.spec);

  /// The screen this widget belongs to (its enclosing scope).
  Screen<Object?> get screen => Screen._forSpec(ScreenScope.of(this));
}

/// A URL the app understands: a [Place] or a [Link]; `parseUrl`
/// returns one.
sealed class const Url([final String? domain]) {
  Uri toUri([String? domain]);
}

/// A POSITION in the tree — a parsed nav-mirror URL. Go-able: every
/// `Place` is a [Hop], so `Screen.go(place)` replays its chain.
sealed class const Place([super.domain]) extends Url implements Hop<AnyNav> {
  @override
  List<(Enum, Object?)> get chain;
  @override
  Enum get spec => chain.last.$1;
  @override
  Object? get id => chain.last.$2;
  @override
  AnyNav get nav => _atOf(_Screens.graph.current);
  @override
  Screen<Object?> get screen => Screen._forSpec(spec);
}

/// A resolve-only branch (declared via `.link`/`slots`): URL-shaped DATA
/// the resolver interprets. NOT a position — no widget, never navigable.
/// Shareable via `Link.<route>.toUri()`; read its fields in `Screen.resolver`.
sealed class const Link([super.domain]) extends Url {
  static _LXPost get post => _LXPost(const <Object?>[], const <int>[]);
  static _LXUserProfile get userProfile =>
      _LXUserProfile(const <Object?>[], const <int>[]);
  static _LXListing get listing => _LXListing(const <Object?>[], const <int>[]);
  static _LXProduct get product => _LXProduct(const <Object?>[], const <int>[]);
  static _LXTask get task => _LXTask(const <Object?>[], const <int>[]);
}

/// The bare root `/` — a plain app-open (no specific destination).
final class const RootUrl([super.domain]) extends Url {
  @override
  Uri toUri([String? domain]) =>
      Uri.parse('${domain ?? 'https://mega.example'}/');
}

/// A nav-mirror `Place` parsed from a URL (e.g. `/home/item/42`); carries
/// the root-down chain so `Screen.go` lands it.
final class const _NavPlace(
  @override final List<(Enum, Object?)> chain, [
  super.domain,
]) extends Place {
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeNavUrl(
      domain ?? 'https://mega.example',
      [for (final c in chain) c.$1],
      [for (final c in chain) c.$2],
    ),
  );
}

sealed class PostLink implements Url {}

sealed class UserProfileLink implements Url {}

sealed class ListingLink implements Url {}

sealed class ProductLink implements Url {}

sealed class TaskLink implements Url {}

final class const PostByIdLink(final String postId, [super.domain])
    extends Link
    implements PostLink {
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'post/*',
      <Object?>[postId],
      <int>[0],
    ),
  );
}

final class const PostLatestLink([super.domain])
    extends Link
    implements PostLink {
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'post/*',
      <Object?>['latest'],
      <int>[1],
    ),
  );
}

final class const UserProfileByUsernameLink(
  final String username, [
  super.domain,
]) extends Link implements UserProfileLink {
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'user-profile/*',
      <Object?>[username],
      <int>[0],
    ),
  );
}

final class const UserProfileMeLink([super.domain])
    extends Link
    implements UserProfileLink {
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'user-profile/*',
      <Object?>['me'],
      <int>[1],
    ),
  );
}

final class const ListingByIdLink(final String listingId, [super.domain])
    extends Link
    implements ListingLink {
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'listing/*',
      <Object?>[listingId],
      <int>[0],
    ),
  );
}

final class const ListingFeaturedLink([super.domain])
    extends Link
    implements ListingLink {
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'listing/*',
      <Object?>['featured'],
      <int>[1],
    ),
  );
}

final class const ProductByIdLink(final String productId, [super.domain])
    extends Link
    implements ProductLink {
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'product/*',
      <Object?>[productId],
      <int>[0],
    ),
  );
}

final class const ProductFeaturedLink([super.domain])
    extends Link
    implements ProductLink {
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'product/*',
      <Object?>['featured'],
      <int>[1],
    ),
  );
}

final class const TaskByIdLink(final String taskId, [super.domain])
    extends Link
    implements TaskLink {
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'task/*',
      <Object?>[taskId],
      <int>[0],
    ),
  );
}

final class const TaskMineLink([super.domain])
    extends Link
    implements TaskLink {
  @override
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'task/*',
      <Object?>['mine'],
      <int>[1],
    ),
  );
}

/// Parses [url] into a [Url]: a declared [Link], a nav-mirror [Place]
/// (go-able), [RootUrl] for bare `/`, or null if it resolves to nothing.
/// The result carries the inbound origin in [Url.domain].
Url? parseUrl(String url) {
  final uri = tryParseUri(url);
  if (uri == null) return null;
  final origin = uri.hasAuthority ? '${uri.scheme}://${uri.authority}' : null;
  final m = _Screens.graph.parseLink(url);
  if (m != null) {
    final link = switch (m.template) {
      'post/*' => switch (m.branches[0]) {
        0 => PostByIdLink(m.path[0] as String, origin),
        1 => PostLatestLink(origin),
        _ => throw StateError('bad union branch'),
      },
      'user-profile/*' => switch (m.branches[0]) {
        0 => UserProfileByUsernameLink(m.path[0] as String, origin),
        1 => UserProfileMeLink(origin),
        _ => throw StateError('bad union branch'),
      },
      'listing/*' => switch (m.branches[0]) {
        0 => ListingByIdLink(m.path[0] as String, origin),
        1 => ListingFeaturedLink(origin),
        _ => throw StateError('bad union branch'),
      },
      'product/*' => switch (m.branches[0]) {
        0 => ProductByIdLink(m.path[0] as String, origin),
        1 => ProductFeaturedLink(origin),
        _ => throw StateError('bad union branch'),
      },
      'task/*' => switch (m.branches[0]) {
        0 => TaskByIdLink(m.path[0] as String, origin),
        1 => TaskMineLink(origin),
        _ => throw StateError('bad union branch'),
      },
      _ => null,
    };
    if (link != null) return link;
  }
  // Bare root → a plain app-open.
  if (uri.pathSegments.where((s) => s.isNotEmpty).isEmpty) {
    return RootUrl(origin);
  }
  // Nav-mirror path → a go-able Place.
  final chain = _Screens.graph.parsePath(url);
  if (chain != null) return _NavPlace(chain, origin);
  return null;
}

class _LXPost(final List<Object?> _p, final List<int> _b) {
  _LXPostSlot byId(String postId) => _LXPostSlot([..._p, postId], [..._b, 0]);
  _LXPostSlot latest() => _LXPostSlot([..._p, 'latest'], [..._b, 1]);
}

class _LXPostSlot(final List<Object?> _p, final List<int> _b) {
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'post/*',
      _p,
      _b,
    ),
  );
}

class _LXUserProfile(final List<Object?> _p, final List<int> _b) {
  _LXUserProfileSlot byUsername(String username) =>
      _LXUserProfileSlot([..._p, username], [..._b, 0]);
  _LXUserProfileSlot me() => _LXUserProfileSlot([..._p, 'me'], [..._b, 1]);
}

class _LXUserProfileSlot(final List<Object?> _p, final List<int> _b) {
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'user-profile/*',
      _p,
      _b,
    ),
  );
}

class _LXListing(final List<Object?> _p, final List<int> _b) {
  _LXListingSlot byId(String listingId) =>
      _LXListingSlot([..._p, listingId], [..._b, 0]);
  _LXListingSlot featured() => _LXListingSlot([..._p, 'featured'], [..._b, 1]);
}

class _LXListingSlot(final List<Object?> _p, final List<int> _b) {
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'listing/*',
      _p,
      _b,
    ),
  );
}

class _LXProduct(final List<Object?> _p, final List<int> _b) {
  _LXProductSlot byId(String productId) =>
      _LXProductSlot([..._p, productId], [..._b, 0]);
  _LXProductSlot featured() => _LXProductSlot([..._p, 'featured'], [..._b, 1]);
}

class _LXProductSlot(final List<Object?> _p, final List<int> _b) {
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'product/*',
      _p,
      _b,
    ),
  );
}

class _LXTask(final List<Object?> _p, final List<int> _b) {
  _LXTaskSlot byId(String taskId) => _LXTaskSlot([..._p, taskId], [..._b, 0]);
  _LXTaskSlot mine() => _LXTaskSlot([..._p, 'mine'], [..._b, 1]);
}

class _LXTaskSlot(final List<Object?> _p, final List<int> _b) {
  Uri toUri([String? domain]) => Uri.parse(
    _Screens.graph.encodeLink(
      domain ?? 'https://mega.example',
      'task/*',
      _p,
      _b,
    ),
  );
}

/// Screen-local query view-state for `feed` (read-only).
class const FeedQuery._() {
  String? get filter =>
      _Screens.graph.viewGet(_Screens.feed, 'filter') as String?;
  String? get sort => _Screens.graph.viewGet(_Screens.feed, 'sort') as String?;
}

/// Mutable [FeedQuery] — set a key (null clears / removes from URL).
final class const FeedQueryMut._() extends FeedQuery {
  this : super._();
  set filter(String? v) => _Screens.graph.viewSet(_Screens.feed, 'filter', v);
  set sort(String? v) => _Screens.graph.viewSet(_Screens.feed, 'sort', v);
}

/// Exactly-one `oneOf` choice for `feed` fragment view-state.
sealed class const FeedFragmentChoice();
final class const FeedFragmentTab(final String value)
    extends FeedFragmentChoice;
final class const FeedFragmentPane(final String value)
    extends FeedFragmentChoice;

/// Screen-local fragment view-state for `feed` (read-only).
class const FeedFragment._() {
  FeedFragmentChoice? get choice {
    {
      final v = _Screens.graph.viewGet(_Screens.feed, 'tab') as String?;
      if (v != null) return FeedFragmentTab(v);
    }
    {
      final v = _Screens.graph.viewGet(_Screens.feed, 'pane') as String?;
      if (v != null) return FeedFragmentPane(v);
    }
    return null;
  }

  bool get top => _Screens.graph.viewGet(_Screens.feed, 'top') == true;
}

/// Mutable [FeedFragment] — set a key (null clears / removes from URL).
final class const FeedFragmentMut._() extends FeedFragment {
  this : super._();
  set choice(FeedFragmentChoice? v) {
    _Screens.graph.viewSet(
      _Screens.feed,
      'tab',
      v is FeedFragmentTab ? v.value : null,
    );
    _Screens.graph.viewSet(
      _Screens.feed,
      'pane',
      v is FeedFragmentPane ? v.value : null,
    );
  }

  set top(bool v) =>
      _Screens.graph.viewSet(_Screens.feed, 'top', v ? true : null);
}

/// Screen-local query view-state for `post` (read-only).
class const PostQuery._() {
  String? get sort => _Screens.graph.viewGet(_Screens.post, 'sort') as String?;
}

/// Mutable [PostQuery] — set a key (null clears / removes from URL).
final class const PostQueryMut._() extends PostQuery {
  this : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.post, 'sort', v);
}

/// Exactly-one `oneOf` choice for `discover` query view-state.
sealed class const DiscoverQueryChoice();
final class const DiscoverQueryPosts() extends DiscoverQueryChoice;
final class const DiscoverQueryPeople() extends DiscoverQueryChoice;
final class const DiscoverQueryTags() extends DiscoverQueryChoice;

/// Screen-local query view-state for `discover` (read-only).
class const DiscoverQuery._() {
  DiscoverQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.discover, 'posts') == true)
      return const DiscoverQueryPosts();
    if (_Screens.graph.viewGet(_Screens.discover, 'people') == true)
      return const DiscoverQueryPeople();
    if (_Screens.graph.viewGet(_Screens.discover, 'tags') == true)
      return const DiscoverQueryTags();
    return null;
  }
}

/// Mutable [DiscoverQuery] — set a key (null clears / removes from URL).
final class const DiscoverQueryMut._() extends DiscoverQuery {
  this : super._();
  set choice(DiscoverQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.discover,
      'posts',
      v is DiscoverQueryPosts ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.discover,
      'people',
      v is DiscoverQueryPeople ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.discover,
      'tags',
      v is DiscoverQueryTags ? true : null,
    );
  }
}

/// Screen-local query view-state for `marketplace` (read-only).
class const MarketplaceQuery._() {
  String? get sort =>
      _Screens.graph.viewGet(_Screens.marketplace, 'sort') as String?;
  ({int min, int max})? get group {
    final min = _Screens.graph.viewGet(_Screens.marketplace, 'min') as int?;
    final max = _Screens.graph.viewGet(_Screens.marketplace, 'max') as int?;
    return (min != null && max != null) ? (min: min, max: max) : null;
  }
}

/// Mutable [MarketplaceQuery] — set a key (null clears / removes from URL).
final class const MarketplaceQueryMut._() extends MarketplaceQuery {
  this : super._();
  set sort(String? v) =>
      _Screens.graph.viewSet(_Screens.marketplace, 'sort', v);
  set group(({int min, int max})? v) {
    _Screens.graph.viewSet(_Screens.marketplace, 'min', v?.min);
    _Screens.graph.viewSet(_Screens.marketplace, 'max', v?.max);
  }
}

/// Exactly-one `oneOf` choice for `search` query view-state.
sealed class const SearchQueryChoice();
final class const SearchQueryAll() extends SearchQueryChoice;
final class const SearchQueryPeople() extends SearchQueryChoice;
final class const SearchQueryPosts() extends SearchQueryChoice;
final class const SearchQueryTags() extends SearchQueryChoice;

/// Screen-local query view-state for `search` (read-only).
class const SearchQuery._() {
  String? get q => _Screens.graph.viewGet(_Screens.search, 'q') as String?;
  SearchQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.search, 'all') == true)
      return const SearchQueryAll();
    if (_Screens.graph.viewGet(_Screens.search, 'people') == true)
      return const SearchQueryPeople();
    if (_Screens.graph.viewGet(_Screens.search, 'posts') == true)
      return const SearchQueryPosts();
    if (_Screens.graph.viewGet(_Screens.search, 'tags') == true)
      return const SearchQueryTags();
    return null;
  }

  ({DateTime from, DateTime to})? get group {
    final from = _Screens.graph.viewGet(_Screens.search, 'from') as DateTime?;
    final to = _Screens.graph.viewGet(_Screens.search, 'to') as DateTime?;
    return (from != null && to != null) ? (from: from, to: to) : null;
  }
}

/// Mutable [SearchQuery] — set a key (null clears / removes from URL).
final class const SearchQueryMut._() extends SearchQuery {
  this : super._();
  set q(String? v) => _Screens.graph.viewSet(_Screens.search, 'q', v);
  set choice(SearchQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.search,
      'all',
      v is SearchQueryAll ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.search,
      'people',
      v is SearchQueryPeople ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.search,
      'posts',
      v is SearchQueryPosts ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.search,
      'tags',
      v is SearchQueryTags ? true : null,
    );
  }

  set group(({DateTime from, DateTime to})? v) {
    _Screens.graph.viewSet(_Screens.search, 'from', v?.from);
    _Screens.graph.viewSet(_Screens.search, 'to', v?.to);
  }
}

/// Screen-local fragment view-state for `search` (read-only).
class const SearchFragment._() {
  String? get view =>
      _Screens.graph.viewGet(_Screens.search, 'view') as String?;
}

/// Mutable [SearchFragment] — set a key (null clears / removes from URL).
final class const SearchFragmentMut._() extends SearchFragment {
  this : super._();
  set view(String? v) => _Screens.graph.viewSet(_Screens.search, 'view', v);
}

/// Exactly-one `oneOf` choice for `workspace` query view-state.
sealed class const WorkspaceQueryChoice();
final class const WorkspaceQueryActive() extends WorkspaceQueryChoice;
final class const WorkspaceQueryArchived() extends WorkspaceQueryChoice;
final class const WorkspaceQueryDraft() extends WorkspaceQueryChoice;

/// Screen-local query view-state for `workspace` (read-only).
class const WorkspaceQuery._() {
  WorkspaceQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.workspace, 'active') == true)
      return const WorkspaceQueryActive();
    if (_Screens.graph.viewGet(_Screens.workspace, 'archived') == true)
      return const WorkspaceQueryArchived();
    if (_Screens.graph.viewGet(_Screens.workspace, 'draft') == true)
      return const WorkspaceQueryDraft();
    return null;
  }
}

/// Mutable [WorkspaceQuery] — set a key (null clears / removes from URL).
final class const WorkspaceQueryMut._() extends WorkspaceQuery {
  this : super._();
  set choice(WorkspaceQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.workspace,
      'active',
      v is WorkspaceQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.workspace,
      'archived',
      v is WorkspaceQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.workspace,
      'draft',
      v is WorkspaceQueryDraft ? true : null,
    );
  }
}

/// Exactly-one `oneOf` choice for `project` query view-state.
sealed class const ProjectQueryChoice();
final class const ProjectQueryActive() extends ProjectQueryChoice;
final class const ProjectQueryArchived() extends ProjectQueryChoice;
final class const ProjectQueryDraft() extends ProjectQueryChoice;

/// Screen-local query view-state for `project` (read-only).
class const ProjectQuery._() {
  String? get sort =>
      _Screens.graph.viewGet(_Screens.project, 'sort') as String?;
  ProjectQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.project, 'active') == true)
      return const ProjectQueryActive();
    if (_Screens.graph.viewGet(_Screens.project, 'archived') == true)
      return const ProjectQueryArchived();
    if (_Screens.graph.viewGet(_Screens.project, 'draft') == true)
      return const ProjectQueryDraft();
    return null;
  }
}

/// Mutable [ProjectQuery] — set a key (null clears / removes from URL).
final class const ProjectQueryMut._() extends ProjectQuery {
  this : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.project, 'sort', v);
  set choice(ProjectQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.project,
      'active',
      v is ProjectQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.project,
      'archived',
      v is ProjectQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.project,
      'draft',
      v is ProjectQueryDraft ? true : null,
    );
  }
}

/// Exactly-one `oneOf` choice for `board` query view-state.
sealed class const BoardQueryChoice();
final class const BoardQueryActive() extends BoardQueryChoice;
final class const BoardQueryArchived() extends BoardQueryChoice;
final class const BoardQueryDraft() extends BoardQueryChoice;

/// Screen-local query view-state for `board` (read-only).
class const BoardQuery._() {
  BoardQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.board, 'active') == true)
      return const BoardQueryActive();
    if (_Screens.graph.viewGet(_Screens.board, 'archived') == true)
      return const BoardQueryArchived();
    if (_Screens.graph.viewGet(_Screens.board, 'draft') == true)
      return const BoardQueryDraft();
    return null;
  }

  ({DateTime from, DateTime to})? get group {
    final from = _Screens.graph.viewGet(_Screens.board, 'from') as DateTime?;
    final to = _Screens.graph.viewGet(_Screens.board, 'to') as DateTime?;
    return (from != null && to != null) ? (from: from, to: to) : null;
  }
}

/// Mutable [BoardQuery] — set a key (null clears / removes from URL).
final class const BoardQueryMut._() extends BoardQuery {
  this : super._();
  set choice(BoardQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.board,
      'active',
      v is BoardQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.board,
      'archived',
      v is BoardQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.board,
      'draft',
      v is BoardQueryDraft ? true : null,
    );
  }

  set group(({DateTime from, DateTime to})? v) {
    _Screens.graph.viewSet(_Screens.board, 'from', v?.from);
    _Screens.graph.viewSet(_Screens.board, 'to', v?.to);
  }
}

/// Exactly-one `oneOf` choice for `taskList` query view-state.
sealed class const TaskListQueryChoice();
final class const TaskListQueryActive() extends TaskListQueryChoice;
final class const TaskListQueryArchived() extends TaskListQueryChoice;
final class const TaskListQueryDraft() extends TaskListQueryChoice;

/// Screen-local query view-state for `taskList` (read-only).
class const TaskListQuery._() {
  String? get sort =>
      _Screens.graph.viewGet(_Screens.taskList, 'sort') as String?;
  TaskListQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.taskList, 'active') == true)
      return const TaskListQueryActive();
    if (_Screens.graph.viewGet(_Screens.taskList, 'archived') == true)
      return const TaskListQueryArchived();
    if (_Screens.graph.viewGet(_Screens.taskList, 'draft') == true)
      return const TaskListQueryDraft();
    return null;
  }
}

/// Mutable [TaskListQuery] — set a key (null clears / removes from URL).
final class const TaskListQueryMut._() extends TaskListQuery {
  this : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.taskList, 'sort', v);
  set choice(TaskListQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.taskList,
      'active',
      v is TaskListQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.taskList,
      'archived',
      v is TaskListQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.taskList,
      'draft',
      v is TaskListQueryDraft ? true : null,
    );
  }
}

/// Exactly-one `oneOf` choice for `task` query view-state.
sealed class const TaskQueryChoice();
final class const TaskQueryActive() extends TaskQueryChoice;
final class const TaskQueryArchived() extends TaskQueryChoice;
final class const TaskQueryDraft() extends TaskQueryChoice;

/// Screen-local query view-state for `task` (read-only).
class const TaskQuery._() {
  String? get sort => _Screens.graph.viewGet(_Screens.task, 'sort') as String?;
  String? get dir => _Screens.graph.viewGet(_Screens.task, 'dir') as String?;
  TaskQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.task, 'active') == true)
      return const TaskQueryActive();
    if (_Screens.graph.viewGet(_Screens.task, 'archived') == true)
      return const TaskQueryArchived();
    if (_Screens.graph.viewGet(_Screens.task, 'draft') == true)
      return const TaskQueryDraft();
    return null;
  }

  ({DateTime from, DateTime to})? get group {
    final from = _Screens.graph.viewGet(_Screens.task, 'from') as DateTime?;
    final to = _Screens.graph.viewGet(_Screens.task, 'to') as DateTime?;
    return (from != null && to != null) ? (from: from, to: to) : null;
  }
}

/// Mutable [TaskQuery] — set a key (null clears / removes from URL).
final class const TaskQueryMut._() extends TaskQuery {
  this : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.task, 'sort', v);
  set dir(String? v) => _Screens.graph.viewSet(_Screens.task, 'dir', v);
  set choice(TaskQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.task,
      'active',
      v is TaskQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.task,
      'archived',
      v is TaskQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.task,
      'draft',
      v is TaskQueryDraft ? true : null,
    );
  }

  set group(({DateTime from, DateTime to})? v) {
    _Screens.graph.viewSet(_Screens.task, 'from', v?.from);
    _Screens.graph.viewSet(_Screens.task, 'to', v?.to);
  }
}

/// Exactly-one `oneOf` choice for `forumCategory` query view-state.
sealed class const ForumCategoryQueryChoice();
final class const ForumCategoryQueryActive() extends ForumCategoryQueryChoice;
final class const ForumCategoryQueryArchived() extends ForumCategoryQueryChoice;
final class const ForumCategoryQueryDraft() extends ForumCategoryQueryChoice;

/// Screen-local query view-state for `forumCategory` (read-only).
class const ForumCategoryQuery._() {
  ForumCategoryQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.forumCategory, 'active') == true)
      return const ForumCategoryQueryActive();
    if (_Screens.graph.viewGet(_Screens.forumCategory, 'archived') == true)
      return const ForumCategoryQueryArchived();
    if (_Screens.graph.viewGet(_Screens.forumCategory, 'draft') == true)
      return const ForumCategoryQueryDraft();
    return null;
  }
}

/// Mutable [ForumCategoryQuery] — set a key (null clears / removes from URL).
final class const ForumCategoryQueryMut._() extends ForumCategoryQuery {
  this : super._();
  set choice(ForumCategoryQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.forumCategory,
      'active',
      v is ForumCategoryQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.forumCategory,
      'archived',
      v is ForumCategoryQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.forumCategory,
      'draft',
      v is ForumCategoryQueryDraft ? true : null,
    );
  }
}

/// Exactly-one `oneOf` choice for `forumThread` query view-state.
sealed class const ForumThreadQueryChoice();
final class const ForumThreadQueryActive() extends ForumThreadQueryChoice;
final class const ForumThreadQueryArchived() extends ForumThreadQueryChoice;
final class const ForumThreadQueryDraft() extends ForumThreadQueryChoice;

/// Screen-local query view-state for `forumThread` (read-only).
class const ForumThreadQuery._() {
  String? get sort =>
      _Screens.graph.viewGet(_Screens.forumThread, 'sort') as String?;
  ForumThreadQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.forumThread, 'active') == true)
      return const ForumThreadQueryActive();
    if (_Screens.graph.viewGet(_Screens.forumThread, 'archived') == true)
      return const ForumThreadQueryArchived();
    if (_Screens.graph.viewGet(_Screens.forumThread, 'draft') == true)
      return const ForumThreadQueryDraft();
    return null;
  }

  ({DateTime from, DateTime to})? get group {
    final from =
        _Screens.graph.viewGet(_Screens.forumThread, 'from') as DateTime?;
    final to = _Screens.graph.viewGet(_Screens.forumThread, 'to') as DateTime?;
    return (from != null && to != null) ? (from: from, to: to) : null;
  }
}

/// Mutable [ForumThreadQuery] — set a key (null clears / removes from URL).
final class const ForumThreadQueryMut._() extends ForumThreadQuery {
  this : super._();
  set sort(String? v) =>
      _Screens.graph.viewSet(_Screens.forumThread, 'sort', v);
  set choice(ForumThreadQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.forumThread,
      'active',
      v is ForumThreadQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.forumThread,
      'archived',
      v is ForumThreadQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.forumThread,
      'draft',
      v is ForumThreadQueryDraft ? true : null,
    );
  }

  set group(({DateTime from, DateTime to})? v) {
    _Screens.graph.viewSet(_Screens.forumThread, 'from', v?.from);
    _Screens.graph.viewSet(_Screens.forumThread, 'to', v?.to);
  }
}

/// Exactly-one `oneOf` choice for `course` query view-state.
sealed class const CourseQueryChoice();
final class const CourseQueryActive() extends CourseQueryChoice;
final class const CourseQueryArchived() extends CourseQueryChoice;
final class const CourseQueryDraft() extends CourseQueryChoice;

/// Screen-local query view-state for `course` (read-only).
class const CourseQuery._() {
  String? get sort =>
      _Screens.graph.viewGet(_Screens.course, 'sort') as String?;
  CourseQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.course, 'active') == true)
      return const CourseQueryActive();
    if (_Screens.graph.viewGet(_Screens.course, 'archived') == true)
      return const CourseQueryArchived();
    if (_Screens.graph.viewGet(_Screens.course, 'draft') == true)
      return const CourseQueryDraft();
    return null;
  }

  ({DateTime from, DateTime to})? get group {
    final from = _Screens.graph.viewGet(_Screens.course, 'from') as DateTime?;
    final to = _Screens.graph.viewGet(_Screens.course, 'to') as DateTime?;
    return (from != null && to != null) ? (from: from, to: to) : null;
  }
}

/// Mutable [CourseQuery] — set a key (null clears / removes from URL).
final class const CourseQueryMut._() extends CourseQuery {
  this : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.course, 'sort', v);
  set choice(CourseQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.course,
      'active',
      v is CourseQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.course,
      'archived',
      v is CourseQueryArchived ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.course,
      'draft',
      v is CourseQueryDraft ? true : null,
    );
  }

  set group(({DateTime from, DateTime to})? v) {
    _Screens.graph.viewSet(_Screens.course, 'from', v?.from);
    _Screens.graph.viewSet(_Screens.course, 'to', v?.to);
  }
}

/// Exactly-one `oneOf` choice for `shopSubcategory` query view-state.
sealed class const ShopSubcategoryQueryChoice();
final class const ShopSubcategoryQueryActive()
    extends ShopSubcategoryQueryChoice;
final class const ShopSubcategoryQueryArchived()
    extends ShopSubcategoryQueryChoice;

/// Screen-local query view-state for `shopSubcategory` (read-only).
class const ShopSubcategoryQuery._() {
  ShopSubcategoryQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.shopSubcategory, 'active') == true)
      return const ShopSubcategoryQueryActive();
    if (_Screens.graph.viewGet(_Screens.shopSubcategory, 'archived') == true)
      return const ShopSubcategoryQueryArchived();
    return null;
  }

  ({int minPrice, int maxPrice})? get group {
    final minPrice =
        _Screens.graph.viewGet(_Screens.shopSubcategory, 'minPrice') as int?;
    final maxPrice =
        _Screens.graph.viewGet(_Screens.shopSubcategory, 'maxPrice') as int?;
    return (minPrice != null && maxPrice != null)
        ? (minPrice: minPrice, maxPrice: maxPrice)
        : null;
  }
}

/// Mutable [ShopSubcategoryQuery] — set a key (null clears / removes from URL).
final class const ShopSubcategoryQueryMut._() extends ShopSubcategoryQuery {
  this : super._();
  set choice(ShopSubcategoryQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.shopSubcategory,
      'active',
      v is ShopSubcategoryQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.shopSubcategory,
      'archived',
      v is ShopSubcategoryQueryArchived ? true : null,
    );
  }

  set group(({int minPrice, int maxPrice})? v) {
    _Screens.graph.viewSet(_Screens.shopSubcategory, 'minPrice', v?.minPrice);
    _Screens.graph.viewSet(_Screens.shopSubcategory, 'maxPrice', v?.maxPrice);
  }
}

/// Exactly-one `oneOf` choice for `product` query view-state.
sealed class const ProductQueryChoice();
final class const ProductQueryActive() extends ProductQueryChoice;
final class const ProductQueryArchived() extends ProductQueryChoice;

/// Screen-local query view-state for `product` (read-only).
class const ProductQuery._() {
  ProductQueryChoice? get choice {
    if (_Screens.graph.viewGet(_Screens.product, 'active') == true)
      return const ProductQueryActive();
    if (_Screens.graph.viewGet(_Screens.product, 'archived') == true)
      return const ProductQueryArchived();
    return null;
  }

  ({int minPrice, int maxPrice})? get group {
    final minPrice =
        _Screens.graph.viewGet(_Screens.product, 'minPrice') as int?;
    final maxPrice =
        _Screens.graph.viewGet(_Screens.product, 'maxPrice') as int?;
    return (minPrice != null && maxPrice != null)
        ? (minPrice: minPrice, maxPrice: maxPrice)
        : null;
  }

  String? get brand =>
      _Screens.graph.viewGet(_Screens.product, 'brand') as String?;
  String? get condition =>
      _Screens.graph.viewGet(_Screens.product, 'condition') as String?;
}

/// Mutable [ProductQuery] — set a key (null clears / removes from URL).
final class const ProductQueryMut._() extends ProductQuery {
  this : super._();
  set choice(ProductQueryChoice? v) {
    _Screens.graph.viewSet(
      _Screens.product,
      'active',
      v is ProductQueryActive ? true : null,
    );
    _Screens.graph.viewSet(
      _Screens.product,
      'archived',
      v is ProductQueryArchived ? true : null,
    );
  }

  set group(({int minPrice, int maxPrice})? v) {
    _Screens.graph.viewSet(_Screens.product, 'minPrice', v?.minPrice);
    _Screens.graph.viewSet(_Screens.product, 'maxPrice', v?.maxPrice);
  }

  set brand(String? v) => _Screens.graph.viewSet(_Screens.product, 'brand', v);
  set condition(String? v) =>
      _Screens.graph.viewSet(_Screens.product, 'condition', v);
}

/// Screen-local query view-state for `workout` (read-only).
class const WorkoutQuery._() {
  String? get sort =>
      _Screens.graph.viewGet(_Screens.workout, 'sort') as String?;
  ({DateTime from, DateTime to})? get group {
    final from = _Screens.graph.viewGet(_Screens.workout, 'from') as DateTime?;
    final to = _Screens.graph.viewGet(_Screens.workout, 'to') as DateTime?;
    return (from != null && to != null) ? (from: from, to: to) : null;
  }
}

/// Mutable [WorkoutQuery] — set a key (null clears / removes from URL).
final class const WorkoutQueryMut._() extends WorkoutQuery {
  this : super._();
  set sort(String? v) => _Screens.graph.viewSet(_Screens.workout, 'sort', v);
  set group(({DateTime from, DateTime to})? v) {
    _Screens.graph.viewSet(_Screens.workout, 'from', v?.from);
    _Screens.graph.viewSet(_Screens.workout, 'to', v?.to);
  }
}
