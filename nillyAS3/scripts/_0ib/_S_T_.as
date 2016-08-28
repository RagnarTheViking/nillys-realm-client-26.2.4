package _0ib
{
   import _2F_._0p;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import _2F_.Console;
   
   public class _S_T_ extends _05E_
   {
       
      
      private var _1X_R_:int;
      
      private var _09z:Object;
      
      private var _0M_K_:uint;
      
      public function _S_T_(param1:Console)
      {
         this._09z = {};
         super(param1);
         param1.cl.addCLCmd("keybinds",this._1Z_Z_,"List all keybinds used");
      }
      
      public function _F_w(param1:_0p, param2:Function, param3:Array = null) : void
      {
         if(config.keystrokePassword && (!param1._5f && param1.key.charAt(0) == config.keystrokePassword.charAt(0)))
         {
            report("Error: KeyBind [" + param1.key + "] is conflicting with Console password.",9);
            return;
         }
         if(param2 == null)
         {
            delete this._09z[param1.key];
         }
         else
         {
            this._09z[param1.key] = [param2,param3];
         }
      }
      
      public function _32(param1:KeyboardEvent) : void
      {
         this._1F_q(param1,false);
      }
      
      public function _X_W_(param1:KeyboardEvent) : void
      {
         this._1F_q(param1,true);
      }
      
      private function _1F_q(param1:KeyboardEvent, param2:Boolean) : void
      {
         var _loc3_:_0p = null;
         var _loc4_:String = String.fromCharCode(param1.charCode);
         if(param2 && config.keystrokePassword != null && _loc4_ && _loc4_ == config.keystrokePassword.substring(this._1X_R_,this._1X_R_ + 1))
         {
            this._1X_R_++;
            if(this._1X_R_ >= config.keystrokePassword.length)
            {
               this._1X_R_ = 0;
               if(this._P_j())
               {
                  if(console.visible && !console.panels.mainPanel.visible)
                  {
                     console.panels.mainPanel.visible = true;
                  }
                  else
                  {
                     console.visible = !console.visible;
                  }
                  if(console.visible && console.panels.mainPanel.visible)
                  {
                     console.panels.mainPanel.visible = true;
                     console.panels.mainPanel.moveBackSafePosition();
                  }
               }
               else if(this._0M_K_ < 3)
               {
                  this._0M_K_++;
                  report("Password did not trigger because you have focus on an input TextField.",8);
               }
            }
         }
         else
         {
            if(param2)
            {
               this._1X_R_ = 0;
            }
            _loc3_ = new _0p(param1.keyCode,param1.shiftKey,param1.ctrlKey,param1.altKey,param2);
            this._0u2(_loc3_.key);
            if(_loc4_)
            {
               _loc3_ = new _0p(_loc4_,param1.shiftKey,param1.ctrlKey,param1.altKey,param2);
               this._0u2(_loc3_.key);
            }
         }
      }
      
      private function _1Z_Z_(... rest) : void
      {
         var _loc2_:* = null;
         var _loc3_:uint = 0;
         report("Key binds:",-2);
         for(_loc2_ in this._09z)
         {
            _loc3_++;
            report(_loc2_,-2);
         }
         report("--- Found " + _loc3_,-2);
      }
      
      private function _0u2(param1:String) : void
      {
         var _loc2_:Array = this._09z[param1];
         if(config.keyBindsEnabled && _loc2_)
         {
            if(this._P_j())
            {
               (_loc2_[0] as Function).apply(null,_loc2_[1]);
            }
            else if(this._0M_K_ < 3)
            {
               this._0M_K_++;
               report("Key bind [" + param1 + "] did not trigger because you have focus on an input TextField.",8);
            }
         }
      }
      
      private function _P_j() : Boolean
      {
         var _loc1_:TextField = null;
         try
         {
            if(console.stage && console.stage.focus is TextField)
            {
               _loc1_ = console.stage.focus as TextField;
               if(_loc1_.type == TextFieldType.INPUT)
               {
                  return false;
               }
            }
         }
         catch(err:Error)
         {
         }
         return true;
      }
   }
}
