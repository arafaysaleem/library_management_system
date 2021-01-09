import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/members_provider.dart';
import '../../../providers/genres_provider.dart';

import '../../../utils/helper.dart';

import '../../widgets/members/member_actions.dart';

import '../../widgets/common/genre_chips.dart';

class MemberProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final membersProvider = Provider.of<MembersProvider>(context);
    final genreProvider = Provider.of<GenresProvider>(context, listen: false);
    final currMember = membersProvider.currentMember;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: currMember == null
              ? CircularProgressIndicator()
              : FutureBuilder(
                  future: genreProvider.getMemberGenres(currMember.id),
                  builder: (ctx, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    membersProvider.setMemberPreferences(snapshot.data);
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          //DP
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: currMember.hasImage
                                ? CircleAvatar(
                                    radius: 55,
                                    backgroundImage: NetworkImage(currMember.imageUrl),
                                  )
                                : CircleAvatar(
                                    radius: 55,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.person,
                                      size: 65,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                          ),

                          SizedBox(height: 10),

                          //Name
                          Text(
                            "${currMember.firstName} ${currMember.lastName}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 20),

                          //Member details
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
                            child: Column(
                              children: [
                                SizedBox(height: 20),

                                //Email
                                Text(
                                  "${currMember.email}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),

                                SizedBox(height: 12),

                                //Age
                                Text(
                                  "${currMember.age} yrs old",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),

                                SizedBox(height: 12),

                                //Membership date
                                Text(
                                  "Membership date: ${Helper.datePresenter(currMember.startDate)}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),

                                SizedBox(height: 12),

                                //Member bio
                                Text(
                                  currMember.bio,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 15),

                                GenreChips(
                                  color: Theme.of(context).primaryColor,
                                  genres: snapshot.data,
                                ),

                                SizedBox(height: 20),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          //Member Actions
                          MemberActions(),

                          SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
