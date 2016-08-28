package _1I_S_
{
   import _S_b._O_e;
   import _0jo._0oc;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.display.DisplayObject;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import _05L_.ChatMessage;
   import _C_._1O_I_;
   
   public class _0O_J_
   {
       
      
      [Inject]
      public var data:String;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _V_8:_0oc;
      
      public function _0O_J_()
      {
         super();
      }
      
      public function fsCommands(param1:String) : Boolean
      {
         var _loc4_:* = undefined;
         param1 = param1.toLowerCase();
         var _loc2_:DisplayObject = Parameters.root;
         if(param1 == "/fs")
         {
            if(_loc2_.stage.scaleMode == StageScaleMode.EXACT_FIT)
            {
               _loc2_.stage.scaleMode = StageScaleMode.NO_SCALE;
               Parameters.data_["stageScale"] = StageScaleMode.NO_SCALE;
            }
            else
            {
               _loc2_.stage.scaleMode = StageScaleMode.EXACT_FIT;
               Parameters.data_["stageScale"] = StageScaleMode.EXACT_FIT;
            }
            Parameters.save();
            _loc2_.dispatchEvent(new Event(Event.RESIZE));
            return true;
         }
         if(param1 == "/mscale")
         {
            this._V_8.dispatch(ChatMessage.make("*Help*","Map Scale: " + Parameters.data_["mscale"] + " - Usage: /mscale <decimal number in the range [0.5; 5]>"));
            return true;
         }
         var _loc3_:Array = param1.match("/mscale (\\d*\\.*\\d+)$");
         if(_loc3_ != null)
         {
            _loc4_ = Number(_loc3_[1]);
            _loc4_ = _loc4_ > 0.5?_loc4_:0.5;
            _loc4_ = _loc4_ < 5?_loc4_:5;
            Parameters.data_["mscale"] = _loc4_;
            Parameters.save();
            _loc2_.dispatchEvent(new Event(Event.RESIZE));
            this._V_8.dispatch(ChatMessage.make("*Help*","Map Scale: " + _loc4_));
            return true;
         }
         if(param1 == "/scaleui")
         {
            Parameters.data_["uiscale"] = !Parameters.data_["uiscale"];
            Parameters.save();
            _loc2_.dispatchEvent(new Event(Event.RESIZE));
            this._V_8.dispatch(ChatMessage.make("*Help*","Scale UI: " + Parameters.data_["uiscale"]));
            return true;
         }
         return false;
      }
      
      public function execute() : void
      {
         if(this.fsCommands(this.data) == true)
         {
            return;
         }
         if(this.data == "/help")
         {
            this._V_8.dispatch(ChatMessage.make(Parameters.HelpText,_1O_I_._0mY_));
         }
         else
         {
            this._1tf._14O_.gsc_.playerText(this.data);
         }
      }
   }
}
