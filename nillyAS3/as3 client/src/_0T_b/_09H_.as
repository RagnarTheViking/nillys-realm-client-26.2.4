package _0T_b
{
   import _1gF_.SimpleText;
   import com.company.ui._0H_R_;
   import _f7.Signal;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   
   public class _09H_ extends _44
   {
       
      
      public var nameText_:SimpleText;
      
      public var inputText_:_0H_R_;
      
      public var _0Q_p:Boolean;
      
      public function _09H_(param1:String, param2:Boolean, param3:uint = 238, param4:uint = 30)
      {
         super();
         this.nameText_ = new SimpleText().setSize(18).setColor(_1nw);
         this.nameText_.setBold(true);
         this.nameText_.setStringBuilder(new _dU_().setParams(param1));
         this.nameText_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.nameText_);
         this.inputText_ = new _0H_R_(20,_1nw,true,param3,param4);
         this.inputText_.y = 30;
         this.inputText_.x = 6;
         this.inputText_.border = false;
         this.inputText_.displayAsPassword = param2;
         this.inputText_.updateMetrics();
         addChild(this.inputText_);
         this._ur(false);
      }
      
      public function text() : String
      {
         return this.inputText_.text;
      }
      
      override public function getHeight() : Number
      {
         return 68;
      }
      
      public function textChanged() : Signal
      {
         return this.nameText_.textChanged;
      }
      
      public function _ur(param1:Boolean) : void
      {
         this._0Q_p = param1;
         _2w(this.inputText_,0,0,param1);
      }
   }
}
