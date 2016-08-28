package _qO_
{
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.text.TextFieldAutoSize;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import _0ib._1R_M_;
   import flash.events.TextEvent;
   import _2F_._0p;
   import flash.text.TextField;
   import _2F_.Console;
   
   public class _n4 extends _0M_f
   {
      
      public static const NAME:String = "rollerPanel";
       
      
      private var _0C_m:Boolean;
      
      public function _n4(param1:Console)
      {
         super(param1);
         name = NAME;
         init(60,100,false);
         _0E_y = _1ae("rollerPrints");
         _0E_y.multiline = true;
         _0E_y.autoSize = TextFieldAutoSize.LEFT;
         _J_7(_0E_y,this.onMenuRollOver,this._02b);
         _07a(_0E_y);
         addChild(_0E_y);
         addEventListener(Event.ENTER_FRAME,this._04u);
         addEventListener(Event.REMOVED_FROM_STAGE,this._1Y_u);
      }
      
      private function _1Y_u(param1:Event = null) : void
      {
         removeEventListener(Event.ENTER_FRAME,this._04u);
         removeEventListener(Event.REMOVED_FROM_STAGE,this._1Y_u);
         if(stage)
         {
            stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._32);
         }
      }
      
      private function _04u(param1:Event) : void
      {
         if(!console.stage)
         {
            this.close();
            return;
         }
         if(this._0C_m)
         {
            _0E_y.htmlText = "<high><menu>Press a key to set [ <a href=\"event:cancel\"><b>cancel</b></a> ]</menu></high>";
         }
         else
         {
            _0E_y.htmlText = "<low>" + this._1le(false) + "</low>";
            _0E_y.autoSize = TextFieldAutoSize.LEFT;
            _0E_y.setSelection(0,0);
         }
         width = _0E_y.width + 4;
         height = _0E_y.height;
      }
      
      public function _1le(param1:Boolean) : String
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:DisplayObjectContainer = null;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:DisplayObject = null;
         var _loc9_:uint = 0;
         var _loc10_:* = null;
         var _loc11_:uint = 0;
         var _loc12_:Stage = console.stage;
         var _loc13_:* = "";
         if(!param1)
         {
            _loc3_ = !!console.rollerCaptureKey?console.rollerCaptureKey.key:"unassigned";
            _loc13_ = "<menu> <a href=\"event:close\"><b>X</b></a></menu> Capture key: <menu><a href=\"event:capture\">" + _loc3_ + "</a></menu><br/>";
         }
         var _loc14_:Point = new Point(_loc12_.mouseX,_loc12_.mouseY);
         if(_loc12_.areInaccessibleObjectsUnderPoint(_loc14_))
         {
            _loc13_ = _loc13_ + "<p9>Inaccessible objects detected</p9><br/>";
         }
         var _loc15_:Array = _loc12_.getObjectsUnderPoint(_loc14_);
         var _loc16_:Dictionary = new Dictionary(true);
         if(_loc15_.length == 0)
         {
            _loc15_.push(_loc12_);
         }
         for each(_loc2_ in _loc15_)
         {
            _loc4_ = new Array(_loc2_);
            _loc5_ = _loc2_.parent;
            while(_loc5_)
            {
               _loc4_.unshift(_loc5_);
               _loc5_ = _loc5_.parent;
            }
            _loc6_ = _loc4_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc8_ = _loc4_[_loc7_];
               if(_loc16_[_loc8_] == undefined)
               {
                  _loc16_[_loc8_] = _loc7_;
                  _loc9_ = _loc7_;
                  while(_loc9_ > 0)
                  {
                     _loc13_ = _loc13_ + (_loc9_ == 1?" ∟":" -");
                     _loc9_--;
                  }
                  _loc10_ = _loc8_.name;
                  if(param1 && console.config.useObjectLinking)
                  {
                     _loc11_ = console.refs.setLogRef(_loc8_);
                     _loc10_ = "<a href=\'event:cl_" + _loc11_ + "\'>" + _loc10_ + "</a> " + console.refs.makeRefTyped(_loc8_);
                  }
                  else
                  {
                     _loc10_ = _loc10_ + " (" + _1R_M_._1xD_(_loc8_) + ")";
                  }
                  if(_loc8_ == _loc12_)
                  {
                     _loc11_ = console.refs.setLogRef(_loc12_);
                     if(_loc11_)
                     {
                        _loc13_ = _loc13_ + ("<p3><a href=\'event:cl_" + _loc11_ + "\'><i>Stage</i></a> ");
                     }
                     else
                     {
                        _loc13_ = _loc13_ + "<p3><i>Stage</i> ";
                     }
                     _loc13_ = _loc13_ + ("[" + _loc12_.mouseX + "," + _loc12_.mouseY + "]</p3><br/>");
                  }
                  else if(_loc7_ == _loc6_ - 1)
                  {
                     _loc13_ = _loc13_ + ("<p5>" + _loc10_ + "</p5><br/>");
                  }
                  else
                  {
                     _loc13_ = _loc13_ + ("<p2><i>" + _loc10_ + "</i></p2><br/>");
                  }
               }
               _loc7_++;
            }
         }
         return _loc13_;
      }
      
      override public function close() : void
      {
         this._1az();
         this._1Y_u();
         super.close();
         console.panels.updateMenu();
      }
      
      private function onMenuRollOver(param1:TextEvent) : void
      {
         var _loc2_:_0p = null;
         var _loc3_:String = !!param1.text?param1.text.replace("event:",""):"";
         if(_loc3_ == "close")
         {
            _loc3_ = "Close";
         }
         else if(_loc3_ == "capture")
         {
            _loc2_ = console.rollerCaptureKey;
            if(_loc2_)
            {
               _loc3_ = "Unassign key ::" + _loc2_.key;
            }
            else
            {
               _loc3_ = "Assign key";
            }
         }
         else if(_loc3_ == "cancel")
         {
            _loc3_ = "Cancel assign key";
         }
         else
         {
            _loc3_ = null;
         }
         console.panels.tooltip(_loc3_,this);
      }
      
      protected function _02b(param1:TextEvent) : void
      {
         TextField(param1.currentTarget).setSelection(0,0);
         if(param1.text == "close")
         {
            this.close();
         }
         else if(param1.text == "capture")
         {
            if(console.rollerCaptureKey)
            {
               console.setRollerCaptureKey(null);
            }
            else
            {
               this._0C_m = true;
               stage.addEventListener(KeyboardEvent.KEY_DOWN,this._32,false,0,true);
            }
            console.panels.tooltip(null);
         }
         else if(param1.text == "cancel")
         {
            this._1az();
            console.panels.tooltip(null);
         }
         param1.stopPropagation();
      }
      
      private function _1az() : void
      {
         this._0C_m = false;
         if(stage)
         {
            stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._32);
         }
      }
      
      private function _32(param1:KeyboardEvent) : void
      {
         if(!param1.charCode)
         {
            return;
         }
         var _loc2_:String = String.fromCharCode(param1.charCode);
         this._1az();
         console.setRollerCaptureKey(_loc2_,param1.shiftKey,param1.ctrlKey,param1.altKey);
         console.panels.tooltip(null);
      }
   }
}
