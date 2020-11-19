import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/members_provider.dart';

import '../../../utils/helper.dart';

class MemberProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final memberProvider = Provider.of<MembersProvider>(context);
    final currMember = memberProvider.currentMember;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: currMember == null
              ? CircularProgressIndicator()
              : SingleChildScrollView(
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
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 20),

                      //Member details
                      Container(
                        color: Colors.white,
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

                            SizedBox(height: 20),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      //Member Actions
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            buildOptionButton(
                              iconColor: Theme.of(context).primaryColor,
                              onTap: () {},
                              action: "Change password",
                              actionColor: Colors.black,
                            ),
                            Divider(height: 10, thickness: 1.3, color: Colors.grey[300]),
                            buildOptionButton(
                              iconColor: Theme.of(context).primaryColor,
                              onTap: () {},
                              action: "Change email",
                              actionColor: Colors.black,
                            ),
                            Divider(height: 10, thickness: 1.3, color: Colors.grey[300]),
                            buildOptionButton(
                              iconColor: Theme.of(context).primaryColor,
                              onTap: () {},
                              action: "Change bio",
                              actionColor: Colors.black,
                            ),
                            Divider(height: 10, thickness: 1.3, color: Colors.grey[300]),
                            buildOptionButton(
                              iconColor: Colors.red,
                              onTap: () {},
                              action: "Deactivate Account",
                              actionColor: Colors.red,
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  InkWell buildOptionButton({
    Color iconColor,
    VoidCallback onTap,
    String action,
    Color actionColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: Helper.hPadding, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Action name
            Text(
              "$action",
              style: TextStyle(
                fontSize: 18,
                color: actionColor,
              ),
            ),

            SizedBox(width: 10),

            //Forward icon
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: iconColor,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
