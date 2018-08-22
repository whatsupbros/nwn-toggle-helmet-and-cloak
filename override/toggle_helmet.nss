/*
 * The script toggles helmet visibility on the main character
 *
 * Author: Denis Savenko
 * Usage Notes:
 *   1. Put this script into Neverwinter Nights Override folder
 *   2. Enable debug mode in game by using the command `##DebugMode 1`
 *   3. Run the script by using the command `##dm_runscript toggle_helmet`
 *   4. Disable debug mode by using the command `##DebugMode 0`
 *   5. Enjoy!
 *
 * Licence information:
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Copyright (c) 2018 Denis Savenko
 */
void main()
{
  // Determine item slot of the item to hide/show
  int nSlot = INVENTORY_SLOT_HEAD;

  // Determine the item to hide/show
  object oItem = GetItemInSlot(nSlot, OBJECT_SELF);

  // If there's no item in the slot, then exit
  if (!GetIsObjectValid(oItem)) {
    return;
  }

  // Determine if currently shown
  int nShown = GetHiddenWhenEquipped(oItem);

  // Toggle the state
  SetHiddenWhenEquipped(oItem, (nShown == TRUE ? FALSE : TRUE));

  // Send feedback
  DelayCommand(0.5, AssignCommand(OBJECT_SELF, ActionSpeakString("Helmet toggled!")));

  // Exit
}
