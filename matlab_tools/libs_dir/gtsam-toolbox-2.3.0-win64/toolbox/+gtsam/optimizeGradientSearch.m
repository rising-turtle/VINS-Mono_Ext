function varargout = optimizeGradientSearch(varargin)
if length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianBayesTree')
    varargout{1} = gtsam_wrapper(2148, varargin{:});
else
    error('Arguments do not match any overload of function gtsam.optimizeGradientSearch');
end
