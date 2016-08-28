package _6w
{
   import _0pN_._049;
   import _aW_.IWebRequest;
   import _3b.DialogSignal;
   import _0E_T_._1zi;
   import kabam.rotmg.assets.model._0V_v;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import _0E_T_._0ih;
   import _0E_T_._Y_F_;
   import com.company.util._C_t;
   import _1O_R_.ErrorDialog;
   
   public class _0x0 extends _049
   {
       
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var classes:_1zi;
      
      public var accountId:String;
      
      public var charId:int;
      
      public var xml:XML;
      
      public var name:String;
      
      public var level:int;
      
      public var type:int;
      
      public var _1Z_E_:String;
      
      public var killer:String;
      
      public var _1__h:int;
      
      public var _0C_3:_0V_v;
      
      public var texture1:int;
      
      public var texture2:int;
      
      public var timer:Timer;
      
      private var _0P_I_:Boolean = false;
      
      public function _0x0()
      {
         this.timer = new Timer(150);
         super();
      }
      
      override protected function startTask() : void
      {
         this.timer.addEventListener(TimerEvent.TIMER,this._0uh);
         this.timer.start();
      }
      
      private function _0uh(param1:TimerEvent) : void
      {
         this.client._R_L_(8);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("char/fame",this._9i());
         this.timer.removeEventListener(TimerEvent.TIMER,this._0uh);
         this.timer.stop();
         this.timer = null;
      }
      
      private function _9i() : Object
      {
         var _loc1_:Object = {};
         _loc1_.accountId = this.accountId;
         _loc1_.charId = this.accountId == ""?-1:this.charId;
         return _loc1_;
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._10H_(param2);
         }
         else
         {
            this._0sU_(param2);
         }
      }
      
      private function _10H_(param1:String) : void
      {
         this.xml = new XML(param1);
         this._pO_();
         _0et(true);
      }
      
      private function _pO_() : void
      {
         var charXml:XML = null;
         var char:_0ih = null;
         var skin:_Y_F_ = null;
         charXml = this.xml.Char.(@id == charId)[0];
         this.name = charXml.Account.Name;
         this.level = charXml.Level;
         this.type = charXml.ObjectType;
         this._1Z_E_ = this._0N_a();
         this.killer = this.xml.KilledBy || "";
         this._1__h = this.xml.TotalFame;
         char = this.classes._0B_M_(charXml.ObjectType);
         skin = !!charXml.hasOwnProperty("Texture")?char._E_G_._nV_(charXml.Texture):char._E_G_._1sW_();
         this._0C_3 = skin._0C_3;
         this.texture1 = !!charXml.hasOwnProperty("Tex1")?int(charXml.Tex1):0;
         this.texture2 = !!charXml.hasOwnProperty("Tex2")?int(charXml.Tex2):0;
      }
      
      private function _0N_a() : String
      {
         var _loc1_:Number = Number(this.xml.CreatedOn) * 1000;
         var _loc2_:Date = new Date(_loc1_);
         var _loc3_:_C_t = new _C_t();
         _loc3_._1nL_ = "MMMM D, YYYY";
         return _loc3_._kQ_(_loc2_);
      }
      
      private function _0sU_(param1:String) : void
      {
         if(this._0P_I_ == false)
         {
            this._0P_I_ = true;
            this.timer = new Timer(600);
            this.timer.addEventListener(TimerEvent.TIMER,this._0uh);
            this.timer.start();
         }
         else
         {
            this._0P_I_ = false;
            this._06Z_.dispatch(new ErrorDialog(param1));
         }
      }
   }
}
