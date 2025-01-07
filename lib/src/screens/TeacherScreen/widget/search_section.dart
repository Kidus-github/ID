import 'package:flutter/material.dart';
import 'package:id/src/constants/text_string.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    hintText: kSearch,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 10.0)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Border color when enabled
                        width: 2.0, // Border thickness
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Border color when focused
                        width: 3.0, // Border thickness when focused
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 18.0)),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  size: 32,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_alt_outlined,
                    size: 32, color: Colors.black)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size.zero,
                backgroundColor: Colors.black, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                padding: const EdgeInsets.all(10.0),
                // Padding inside the button
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white, // Icon color
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Divider(
          thickness: 2,
          color: Color(0xffD9D9D9),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
