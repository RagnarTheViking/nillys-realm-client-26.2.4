package _qO_
{
   import flash.events.TextEvent;
   import _2F_.Console;
   import flash.text.TextFieldAutoSize;
   
   public class _1Y_h extends _0M_f
   {
      
      public static const NAME:String = "channelsPanel";
       
      
      public function _1Y_h(param1:Console)
      {
         super(param1);
         name = NAME;
         init(10,10,false);
         _0E_y = _1ae("channelsField");
         _0E_y.wordWrap = true;
         _0E_y.width = 160;
         _0E_y.multiline = true;
         _0E_y.autoSize = TextFieldAutoSize.LEFT;
         _J_7(_0E_y,this.onMenuRollOver,this._02b);
         _07a(_0E_y);
         addChild(_0E_y);
      }
      
      public function update() : void
      {
         _0E_y.wordWrap = false;
         _0E_y.width = 80;
         var _loc1_:String = "<high><menu> <b><a href=\"event:close\">X</a></b></menu> " + console.panels.mainPanel.getChannelsLink();
         _0E_y.htmlText = _loc1_ + "</high>";
         if(_0E_y.width > 160)
         {
            _0E_y.wordWrap = true;
            _0E_y.width = 160;
         }
         width = _0E_y.width + 4;
         height = _0E_y.height;
      }
      
      private function onMenuRollOver(param1:TextEvent) : void
      {
         console.panels.mainPanel.onMenuRollOver(param1,this);
      }
      
      protected function _02b(param1:TextEvent) : void
      {
         _0E_y.setSelection(0,0);
         if(param1.text == "close")
         {
            console.panels.channelsPanel = false;
         }
         else if(param1.text.substring(0,8) == "channel_")
         {
            console.panels.mainPanel.onChannelPressed(param1.text.substring(8));
         }
         _0E_y.setSelection(0,0);
         param1.stopPropagation();
      }
   }
}
